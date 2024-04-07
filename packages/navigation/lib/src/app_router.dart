import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:medical_kit/medical_kit.dart';
import 'package:prescriptions/prescriptions.dart';
import 'package:splash/splash.dart';

import '../navigation.dart';
import 'route_builder.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: <Type>[
  SplashModule,
  HomeModule,
  MedicalKitModule,
  PrescriptionsModule,
])
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: <AutoRoute>[
            AutoRoute(
              page: PrescriptionsRoute.page,
            ),
            AutoRoute(
              initial: true,
              page: MedicalKitRoute.page,
            ),
          ],
        ),

        // Medical Kit
        CustomRoute(
          page: AddMedicationRoute.page,
          customRouteBuilder: RouteBuilder.screen,
        ),
        CustomRoute(
          page: StoredMedicationsRoute.page,
          customRouteBuilder: RouteBuilder.screen,
        ),
        CustomRoute(
          page: AddStoredMedicationRoute.page,
          customRouteBuilder: RouteBuilder.screen,
        ),

        // Prescriptions
        CustomRoute(
          page: AddPrescriptionRoute.page,
          customRouteBuilder: RouteBuilder.screen,
        ),
        // Prescriptions
        CustomRoute(
          page: AddPrescriptionEntryRoute.page,
          customRouteBuilder: RouteBuilder.bottomSheet,
        ),
      ];
}
