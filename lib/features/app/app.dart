import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/core/injection/dependency_injection.dart';
import 'package:lookup/core/route/app_router.dart';
import 'package:lookup/core/theme/theme.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/features/login/presentation/bloc/login_bloc.dart';
import 'package:lookup/features/splash/bloc/splash_bloc.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_bloc.dart';
import 'package:lookup/utils/ui_helper.dart';

class App extends StatelessWidget {
  App({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => sl<LoginBloc>(),
        ),
        BlocProvider<AppProfileBloc>(
          create: (BuildContext context) => sl<AppProfileBloc>(),
        ),
        BlocProvider<VideoFeedBloc>(
          create: (BuildContext context) => sl<VideoFeedBloc>(),
        ),
        BlocProvider<SplashBloc>(
          create: (BuildContext context) => sl<SplashBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        child: GestureDetector(
          onTap: () => UiHelper.dissmissKeyboard(context),
          child: MaterialApp.router(
            theme: mAppTheme(),
            routerConfig: appRouter.config(),
          ),
        ),
      ),
    );
  }
}
