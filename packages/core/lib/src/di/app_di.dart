import 'package:get_it/get_it.dart';

final AppDI appDI = AppDI._();

class AppDI {
  final GetIt _getIt = GetIt.asNewInstance();

  AppDI._();

  T get<T extends Object>() => _getIt.get<T>();

  void registerSingleton<T extends Object>(T object) => _getIt.registerSingleton<T>(object);

  void registerLazySingleton<T extends Object>(T Function() factory) => _getIt.registerLazySingleton<T>(factory);
}
