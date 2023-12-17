import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/common/clipper/bottom_curve_clipper.dart';
import 'package:lookup/res/colors.dart';

class OverlayBanner extends StatefulWidget {
  const OverlayBanner({super.key, this.onBannerDismissed});

  final VoidCallback? onBannerDismissed;

  @override
  State<OverlayBanner> createState() => _OverlayBannerState();
}

class _OverlayBannerState extends State<OverlayBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const Curve curve = Curves.easeOut;
  bool animationCompleted = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _playAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        final animationValue = curve.transform(_controller.value);
        return FractionalTranslation(
          translation: Offset(0, -(1 - animationValue)),
          child: child,
        );
      },
      animation: _controller,
      child: SingleChildScrollView(
        child: ClipPath(
          clipper: animationCompleted ? null : BottomCurveClipper(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    await _controller.forward().then((value) {
      animationCompleted = true;
      setState(() {});
    });
    if (mounted) {
      unawaited(AutoRouter.of(context).push(const PreloaderRoute()));
    }

    await Future.delayed(
      const Duration(milliseconds: 150),
      () => widget.onBannerDismissed?.call(),
    );
  }
}
