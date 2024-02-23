import 'package:auto_route/auto_route.dart';
import 'package:splash/splash.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: <Type>[
  SplashModule,
])
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
      ];
}
