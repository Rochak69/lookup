import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lookup/features/common/clipper/top_downward_curve_clipper.dart';
import 'package:lookup/features/common/overlays/overlay_helper.dart';
import 'package:lookup/features/common/widgets/app_button.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/common/widgets/app_textform_field.dart';
import 'package:lookup/features/common/widgets/horizontal_spacing.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/res/index.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
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
                      Column(
                        children: [
                          VerticalSpacing(70.h),
                          Image.asset(
                            AppImages.lookupWhiteEyeOpen,
                            height: 34.h,
                          ),
                          VerticalSpacing(10.h),
                          Text(
                            'Please fill your login details',
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ],
                      ),
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
                        title: 'Email',
                        textInputAction: TextInputAction.next,
                        validator: ValidationBuilder().email().build(),
                      ),
                      VerticalSpacing(20.h),
                      const AppTextFormField(
                        obscureText: true,
                        title: 'Password',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 8,
                                  child: Icon(
                                    Icons.mail,
                                    size: 28.sp,
                                  ),
                                ),
                                HorizontalSpacing(16.w),
                                Card(
                                  elevation: 8,
                                  child: Icon(
                                    Icons.mail,
                                    size: 28.sp,
                                  ),
                                ),
                                HorizontalSpacing(16.w),
                                Card(
                                  elevation: 8,
                                  child: Icon(
                                    Icons.mail,
                                    size: 28.sp,
                                  ),
                                ),
                              ],
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
                                      ..onTap = () => debugPrint('aa'),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AppButton.white(
                                onTap: () {},
                                text: 'SIGNUP',
                                textStyle: TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            HorizontalSpacing(10.w),
                            Expanded(
                              child: AppButton.blue(
                                onTap: () => login(context),
                                text: 'LOGIN',
                                textStyle: TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    OverlayHelper.displayOverlay(
      context,
    );

    if (_formKey.currentState!.validate()) {}
  }
}
