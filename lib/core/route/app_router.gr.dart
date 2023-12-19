// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:lookup/features/homepage/data/all_feeds_model.dart' as _i7;
import 'package:lookup/features/homepage/presentation/screens/home_screen.dart'
    as _i1;
import 'package:lookup/features/login/presentation/screens/login_screen.dart'
    as _i2;
import 'package:lookup/features/preloader/presentation/preloader_screen.dart'
    as _i3;
import 'package:lookup/features/splash/splash_screen.dart' as _i4;
import 'package:lookup/features/video_page/presentation/screen/video_screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    PreloaderRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PreloaderScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
    VideoRoute.name: (routeData) {
      final args = routeData.argsAs<VideoRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.VideoScreen(
          feed: args.feed,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PreloaderScreen]
class PreloaderRoute extends _i6.PageRouteInfo<void> {
  const PreloaderRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PreloaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreloaderRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.VideoScreen]
class VideoRoute extends _i6.PageRouteInfo<VideoRouteArgs> {
  VideoRoute({
    required _i7.FeedData feed,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          VideoRoute.name,
          args: VideoRouteArgs(
            feed: feed,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoRoute';

  static const _i6.PageInfo<VideoRouteArgs> page =
      _i6.PageInfo<VideoRouteArgs>(name);
}

class VideoRouteArgs {
  const VideoRouteArgs({
    required this.feed,
    this.key,
  });

  final _i7.FeedData feed;

  final _i8.Key? key;

  @override
  String toString() {
    return 'VideoRouteArgs{feed: $feed, key: $key}';
  }
}
