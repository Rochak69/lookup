import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lookup/res/colors.dart';

class UiHelper {
  static void showloaderdialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black26,
      builder: (context) => PopScope(
        onPopInvoked: (didPop) {},
        canPop: false,
        child: Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: AppColors.white,
            size: 40.r,
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
