import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookup/features/common/clipper/bottom_curve_clipper.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/splash/bloc/splash_bloc.dart';
import 'package:lookup/features/splash/screen/widgets/blue_left_to_right_overlay.dart';
import 'package:lookup/features/splash/screen/widgets/splash_lookup_logo.dart';
import 'package:lookup/features/splash/screen/widgets/top_animated_login.dart';
import 'package:lookup/res/index.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _heightController;
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;
  Animation<double>? _heightAnimation;

  @override
  void initState() {
    super.initState();

    _heightController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _colorController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: AppColors.homeTextGrey,
      end: AppColors.white,
    ).animate(_colorController);

    _colorAnimation.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        BlocProvider.of<SplashBloc>(context).add(StartLogoChange());
      } else if (status == AnimationStatus.completed) {
        BlocProvider.of<SplashBloc>(context).add(ShowLoginButton());
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _heightAnimation = Tween<double>(
        begin: 0,
        end: MediaQuery.of(context).size.height,
      ).animate(
        CurvedAnimation(
          parent: _heightController,
          curve: Curves.easeInOut,
        ),
      );

      _playAnimation();
    });
  }

  Future<void> _playAnimation() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        _heightController.forward().then((value) {
          BlocProvider.of<SplashBloc>(context).add(CompleteHeightAnimation());
          _colorController.forward();
        });
      },
    );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return AppScaffold(
          body: Stack(
            children: [
              state.isHeightAnimationComplete
                  ? AnimatedBuilder(
                      animation: _colorController,
                      builder: (context, child) => Container(
                        color: _colorAnimation.value,
                      ),
                    )
                  : AnimatedBuilder(
                      animation: _heightController,
                      builder: (context, child) => ClipPath(
                        clipper: _heightAnimation?.value ==
                                MediaQuery.of(context).size.height
                            ? null
                            : BottomCurveClipper(),
                        child: Container(
                          color: _colorAnimation.value,
                          height: _heightAnimation?.value ?? 0,
                        ),
                      ),
                    ),
              SplashLookupLogo(
                heightAnimation: _heightAnimation,
                heightController: _heightController,
              ),
              const BlueLeftToRightOverlay(),
              const TopAnimatedLoginButton(),
            ],
          ),
        );
      },
    );
  }
}