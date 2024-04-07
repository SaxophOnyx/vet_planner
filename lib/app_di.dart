import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

Future<void> setupAppDI() async {
  await _setupNavigation();
  await _setupRepositories();
  await _setupUseCases();
}

Future<void> _setupNavigation() async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  appDI.registerSingleton<AppRouter>(
    AppRouter(navigatorKey: navigatorKey),
  );
}

Future<void> _setupRepositories() async {
  appDI.registerSingleton<MedicationRepository>(
    InMemoryMedicationRepository(),
  );
}

Future<void> _setupUseCases() async {
  appDI.registerSingleton<GetMedicationsUseCase>(
    GetMedicationsUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );

  appDI.registerSingleton<AddMedicationUseCase>(
    AddMedicationUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );

  appDI.registerSingleton<GetStoredMedicationsForMedicationUseCase>(
    GetStoredMedicationsForMedicationUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );

  appDI.registerSingleton<AddStoredMedicationUseCase>(
    AddStoredMedicationUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );
}
