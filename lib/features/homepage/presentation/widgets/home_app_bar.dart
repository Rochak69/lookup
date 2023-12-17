import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/res/app_images.dart';
import 'package:lookup/res/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        AppImages.lookupWhiteEyeOpen,
        height: 20.h,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: InkWell(
            onTap: () => AutoRouter.of(context).pop(),
            child: Image.asset(
              AppImages.action,
              width: 24.w,
            ),
          ),
        ),
      ],
      iconTheme: const IconThemeData(color: AppColors.white),
      leadingWidth: 48.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 22.w),
        child: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Image.asset(
            AppImages.tableMenu,
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
