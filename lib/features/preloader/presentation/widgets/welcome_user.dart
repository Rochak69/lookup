import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/res/index.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppProfileBloc, AppProfileState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'welcome ${state.user?.name ?? 'User'}',
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
    ).animate(delay: const Duration(milliseconds: 1000)).fadeIn();
  }
}
