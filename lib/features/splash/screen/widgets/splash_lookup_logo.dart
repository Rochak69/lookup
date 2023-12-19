import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/splash/bloc/splash_bloc.dart';
import 'package:lookup/res/colors.dart';

class SplashLookupLogo extends StatelessWidget {
  const SplashLookupLogo({
    required this.heightAnimation,
    required this.heightController,
    super.key,
  });
  final Animation<double>? heightAnimation;
  final AnimationController heightController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 57.w),
        child: AnimatedBuilder(
          animation: heightController,
          builder: (context, child) => BlocBuilder<SplashBloc, SplashState>(
            buildWhen: (previous, current) => previous.logo != current.logo,
            builder: (context, state) {
              return Image.asset(
                state.logo,
                color: (heightAnimation?.value ?? 0) >
                        MediaQuery.of(context).size.height / 2
                    ? AppColors.primary
                    : AppColors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}
