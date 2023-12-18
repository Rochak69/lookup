import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lookup/res/index.dart';

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

  static void dissmissKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static void showSnackbar(
    BuildContext context, {
    required String? message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ''),
      ),
    );
  }
}
