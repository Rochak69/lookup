import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/login/presentation/bloc/login_bloc.dart';
import 'package:lookup/res/app_images.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacing(70.h),
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              previous.isTypingPassword != current.isTypingPassword,
          builder: (context, state) {
            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: Image.asset(
                AppImages.lookupWhiteEyeOpen,
                height: 34.h,
              ),
              secondChild: Image.asset(
                AppImages.lookupWhite,
                height: 34.h,
              ),
              crossFadeState: state.isTypingPassword
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            );
          },
        ),
        VerticalSpacing(10.h),
        Text(
          'Please fill your login details',
          style: TextStyle(
            fontSize: 9.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
