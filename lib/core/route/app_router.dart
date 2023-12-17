import 'package:auto_route/auto_route.dart';

import 'package:lookup/core/route/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: PreloaderRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
