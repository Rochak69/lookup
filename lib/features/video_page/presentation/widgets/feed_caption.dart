import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/features/homepage/data/all_feeds_data.dart';
import 'package:lookup/res/colors.dart';

class FeedCaption extends StatelessWidget {
  const FeedCaption({required this.feedModel, super.key});
  final FeedData feedModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: BlocBuilder<AppProfileBloc, AppProfileState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.user?.email ?? '@lana_love123',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              Text(
                "ID- ${feedModel.id} What's your favorite song ?",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
