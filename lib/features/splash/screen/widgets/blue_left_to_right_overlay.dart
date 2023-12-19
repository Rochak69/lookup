import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lookup/res/colors.dart';

class BlueLeftToRightOverlay extends StatelessWidget {
  const BlueLeftToRightOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
    )
        .animate(
          delay: const Duration(milliseconds: 300),
        )
        .slide(
          begin: Offset.zero,
          end: const Offset(1, 0),
          duration: const Duration(milliseconds: 1200),
        );
  }
}
