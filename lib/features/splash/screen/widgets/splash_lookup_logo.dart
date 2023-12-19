import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/splash/bloc/splash_bloc.dart';
import 'package:lookup/res/colors.dart';

class SplashLookupLogo extends StatelessWidget {
  const SplashLookupLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 57.w),
        child: BlocBuilder<SplashBloc, SplashState>(
          buildWhen: (previous, current) =>
              previous.logo != current.logo ||
              previous.changeLogoColor != current.changeLogoColor,
          builder: (context, state) {
            return Image.asset(
              state.logo,
              color:
                  state.changeLogoColor ? AppColors.primary : AppColors.white,
            );
          },
        ),
      ),
    );
  }
}
