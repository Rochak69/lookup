import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/res/index.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => AutoRouter.of(context).replace(const LoginRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 57.w),
          child: Image.asset(
            AppImages.lookupWhite,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
