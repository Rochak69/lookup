import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/features/common/clipper/top_downward_curve_clipper.dart';
import 'package:lookup/features/common/overlays/overlay_helper.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/common/widgets/app_textform_field.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/login/presentation/bloc/login_bloc.dart';
import 'package:lookup/features/login/presentation/screens/widgets/login_header.dart';
import 'package:lookup/features/login/presentation/screens/widgets/login_signup_buttons.dart';
import 'package:lookup/features/login/presentation/screens/widgets/social_logins.dart';
import 'package:lookup/res/index.dart';
import 'package:lookup/utils/ui_helper.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.theStates == TheStates.sucess) {
            Navigator.pop(context);
            BlocProvider.of<AppProfileBloc>(context)
                .add(AddUserDetails(user: state.user));
            OverlayHelper.showOverlay(
              context,
              routePage: const PreloaderRoute(),
            );
          } else if (state.theStates == TheStates.loadng) {
            UiHelper.showloaderdialog(context);
          } else if (state.theStates == TheStates.error) {
            Navigator.pop(context);
            UiHelper.showSnackbar(
              context,
              message: state.errorMessage,
            );
          }
        },
        listenWhen: (previous, current) =>
            previous.theStates != current.theStates,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const LoginHeader(),
                        VerticalSpacing(53.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 29.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        VerticalSpacing(20.h),
                        AppTextFormField(
                          textEditingController: emailController,
                          title: 'Email',
                          textInputAction: TextInputAction.next,
                          validator: ValidationBuilder().email().build(),
                        ),
                        VerticalSpacing(20.h),
                        FocusScope(
                          child: Focus(
                            onFocusChange: (focus) =>
                                BlocProvider.of<LoginBloc>(context)
                                    .add(PasswordTypingEvent(isTyping: focus)),
                            child: AppTextFormField(
                              textEditingController: passwordController,
                              obscureText: true,
                              title: 'Password',
                              textInputAction: TextInputAction.done,
                              validator:
                                  ValidationBuilder().minLength(6).build(),
                            ),
                          ),
                        ),
                        VerticalSpacing(140.h),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipPath(
                        clipper: TopDownwardCurvedClipper(),
                        child: Container(
                          height: 346.h,
                          width: double.infinity,
                          color: AppColors.white,
                          child: Column(
                            children: [
                              VerticalSpacing(80.h),
                              Text(
                                'or login with',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              VerticalSpacing(15.h),
                              SocialLogins(
                                onTap: () {
                                  socialLogin(context);
                                },
                              ),
                              VerticalSpacing(100.h),
                              RichText(
                                text: TextSpan(
                                  text: 'Dont have an account yet?',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.primary,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' SIGNUP',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            _signUpWithCredential(context),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -14.h,
                        left: 0,
                        right: 0,
                        child: LoginSignUpButtons(
                          onLogin: () => _loginWithCredential(context),
                          onSignUp: () => _signUpWithCredential(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void socialLogin(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(GoogleLoginEvent());
  }

  void _loginWithCredential(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      UiHelper.dissmissKeyboard(context);
      BlocProvider.of<LoginBloc>(context).add(
        CredentialLoginEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  void _signUpWithCredential(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      UiHelper.dissmissKeyboard(context);
      BlocProvider.of<LoginBloc>(context).add(
        SignUpWthCredentialEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
