import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/common/clipper/bottom_curve_clipper.dart';
import 'package:lookup/features/common/overlays/overlay_helper.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/splash/bloc/splash_bloc.dart';
import 'package:lookup/res/colors.dart';

class TopAnimatedLoginButton extends StatelessWidget {
  const TopAnimatedLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      buildWhen: (previous, current) => previous.showLogin != current.showLogin,
      builder: (context, state) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: state.showLogin ? 1 : 0,
          child: ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: 120.h,
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      OverlayHelper.showOverlay(
                        context,
                        routePage: const LoginRoute(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  VerticalSpacing(32.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
