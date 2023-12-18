import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/features/common/clipper/top_upward_curve_clipper.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/preloader/data/preloader_list.dart';
import 'package:lookup/features/preloader/presentation/widgets/selectable_interest.dart';
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
                      : BlocBuilder<AppProfileBloc, AppProfileState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'welcome ${state.user?.name ?? ''}',
                                      style: TextStyle(
                                        fontSize: 32.sp,
                                        color: AppColors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                          .animate(delay: const Duration(milliseconds: 1000))
                          .fadeIn(),
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
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(const HomeRoute());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 4.h,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Skip',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
