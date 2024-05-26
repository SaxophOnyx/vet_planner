import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

Future<void> setupAppDI() async {
  await _setupNavigation();
  await _setupProviders();
  await _setupRepositories();
  await _setupUseCases();
}

Future<void> _setupNavigation() async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  appDI.registerSingleton<AppRouter>(
    AppRouter(navigatorKey: navigatorKey),
  );
}

Future<void> _setupProviders() async {
  appDI.registerSingleton<AppDatabase>(
    AppDatabase(),
  );

  appDI.registerSingletonAsync(
    () async => await LocalDataProvider.createInstance(),
  );

  await appDI.ready();

  appDI.registerSingleton<MedicationProvider>(
    MedicationProvider(
      appDatabase: appDI.get<AppDatabase>(),
    ),
  );

  appDI.registerSingleton<StoredMedicationProvider>(
    StoredMedicationProvider(
      appDatabase: appDI.get<AppDatabase>(),
    ),
  );

  appDI.registerSingleton<NotificationSettingsProvider>(
    NotificationSettingsProvider(
      localDataProvider: appDI.get<LocalDataProvider>(),
    ),
  );

  appDI.registerSingleton<PrescriptionProvider>(
    PrescriptionProvider(
      appDatabase: appDI.get<AppDatabase>(),
    ),
  );

  appDI.registerSingleton<PrescriptionEntryProvider>(
    PrescriptionEntryProvider(
      appDatabase: appDI.get<AppDatabase>(),
    ),
  );

  appDI.registerSingleton<PatientProvider>(
    PatientProvider(
      appDatabase: appDI.get<AppDatabase>(),
    ),
  );

  appDI.registerSingleton<NotificationProvider>(
    NotificationProvider(),
  );
}

Future<void> _setupRepositories() async {
  appDI.registerSingleton<MedicationRepository>(
    MedicationRepositoryImpl(
      medicationProvider: appDI.get<MedicationProvider>(),
      storedMedicationProvider: appDI.get<StoredMedicationProvider>(),
    ),
  );

  appDI.registerSingleton<PrescriptionRepository>(
    PrescriptionRepositoryImpl(
      medicationProvider: appDI.get<MedicationProvider>(),
      storedMedicationProvider: appDI.get<StoredMedicationProvider>(),
      prescriptionProvider: appDI.get<PrescriptionProvider>(),
      prescriptionEntryProvider: appDI.get<PrescriptionEntryProvider>(),
    ),
  );

  appDI.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(
      notificationSettingsProvider: appDI.get<NotificationSettingsProvider>(),
    ),
  );

  appDI.registerSingleton<PatientRepository>(
    PatientRepositoryImpl(
      patientProvider: appDI.get<PatientProvider>(),
    ),
  );

  appDI.registerSingleton<NotificationsRepository>(
    NotificationRepositoryImpl(
      notificationProvider: appDI.get<NotificationProvider>(),
    ),
  );
}

Future<void> _setupUseCases() async {
  appDI.registerSingleton<GetNotificationSettingsUseCase>(
    GetNotificationSettingsUseCase(
      settingsRepository: appDI.get<SettingsRepository>(),
    ),
  );

  appDI.registerSingleton<UpdateNotificationSettingsUseCase>(
    UpdateNotificationSettingsUseCase(
      settingsRepository: appDI.get<SettingsRepository>(),
    ),
  );

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

  appDI.registerSingleton<GetStoredMedicationsUseCase>(
    GetStoredMedicationsUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );

  appDI.registerSingleton<AddStoredMedicationUseCase>(
    AddStoredMedicationUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );

  appDI.registerSingleton<ObserveStoredMedicationCreatedUseCase>(
    ObserveStoredMedicationCreatedUseCase(
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );

  appDI.registerSingleton<GetExpiringPrescriptionEntriesUseCase>(
    GetExpiringPrescriptionEntriesUseCase(
      prescriptionRepository: appDI.get<PrescriptionRepository>(),
    ),
  );

  appDI.registerSingleton<AddPrescriptionUseCase>(
    AddPrescriptionUseCase(
      prescriptionRepository: appDI.get<PrescriptionRepository>(),
    ),
  );

  appDI.registerSingleton<GetPrescriptionByIdUseCase>(
    GetPrescriptionByIdUseCase(
      prescriptionRepository: appDI.get<PrescriptionRepository>(),
    ),
  );

  appDI.registerSingleton<DeletePrescriptionEntriesByIdsUseCase>(
    DeletePrescriptionEntriesByIdsUseCase(
      prescriptionRepository: appDI.get<PrescriptionRepository>(),
    ),
  );

  appDI.registerSingleton<GetPatientByIdUseCase>(
    GetPatientByIdUseCase(
      patientRepository: appDI.get<PatientRepository>(),
    ),
  );

  appDI.registerSingleton<TestUseCase>(
    TestUseCase(
      patientRepository: appDI.get<PatientRepository>(),
      prescriptionRepository: appDI.get<PrescriptionRepository>(),
      medicationRepository: appDI.get<MedicationRepository>(),
    ),
  );
}
