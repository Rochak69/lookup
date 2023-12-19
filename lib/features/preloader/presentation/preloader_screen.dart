import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/clipper/top_upward_curve_clipper.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/preloader/data/preloader_list.dart';
import 'package:lookup/features/preloader/presentation/widgets/selectable_interest.dart';
import 'package:lookup/features/preloader/presentation/widgets/skip_button.dart';
import 'package:lookup/features/preloader/presentation/widgets/welcome_user.dart';
import 'package:lookup/res/app_images.dart';
import 'package:lookup/res/colors.dart';

@RoutePage()
class PreloaderScreen extends StatefulWidget {
  const PreloaderScreen({super.key});

  @override
  State<PreloaderScreen> createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  bool showInterest = false;

  @override
  void initState() {
    super.initState();
    changeText();
  }

  Future<void> changeText() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        setState(() {
          showInterest = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 28.w, right: 16.w),
              child: Column(
                children: [
                  VerticalSpacing(240.h),
                  Image.asset(
                    AppImages.hiPng,
                    height: 32.h,
                  ).animate(delay: const Duration(milliseconds: 300)).fadeIn(),
                  VerticalSpacing(10.h),
                  showInterest
                      ? Text(
                          'Is there something you  Specific you want to see today ?',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const WelcomeUser(),
                  VerticalSpacing(12.h),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              opacity: showInterest ? 1 : 0,
              child: ClipPath(
                clipper: TopUpwardCurveClipper(),
                child: Container(
                  width: double.infinity,
                  color: AppColors.white,
                  child: Column(
                    children: [
                      VerticalSpacing(100.h),
                      Image.asset(
                        AppImages.interestPng,
                        width: 28.w,
                      ),
                      VerticalSpacing(10.h),
                      Text(
                        'Today’s Interest ?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: preloaderList.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 28.h,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 20.h,
                          childAspectRatio: 4,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => SelectableInterest(
                          interest: preloaderList[index],
                        ),
                      ),
                      VerticalSpacing(12.h),
                      const SkipButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
