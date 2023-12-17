import 'package:flutter/material.dart';
import 'package:lookup/res/colors.dart';

class ShadowedContainer extends StatelessWidget {
  const ShadowedContainer({
    this.borderRadius,
    super.key,
    this.color = AppColors.white,
    this.child,
    this.margin,
    this.height,
    this.padding,
  });
  final Color color;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.buttonShadow,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        color: color,
        border: Border.all(color: AppColors.white),
        borderRadius: borderRadius,
      ),
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}
