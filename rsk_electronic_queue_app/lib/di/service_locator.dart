import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/splash_page/cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt
    .instance; // Создает экземпляр локатора службы GetIt с именем sl, который будет использоваться для регистрации и получения зависимостей.

Future<void> init() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Гарантирует инициализацию привязки к фреймворку Flutter.

  /// Shared Preferences
  final sharedPreferences = await SharedPreferences
      .getInstance(); // Создаём экземпляр `SharedPreferences` и ожидаем его инициализации.

  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  ); // Позволяет получить доступ к экземпляру `SharedPreferences` во всем приложении.

  /// Repository
  // sl.registerLazySingleton<RepositoryName>(
  //   () => Repository(repository: sl()),
  // );

  /// UseCases
  // sl.registerLazySingleton<NameCase>(
  //   () => NameCase(
  //     repository: sl(),
  //     prefs: sl(),
  //     userRepository: sl(),
  //   ),
  // );

  /// BloCs / Cubits
  sl.registerLazySingleton(
    () => SplashCubit()
      ..initialisation(), // выполнена инициализация `SplashCubit` вызовом метода `initialisation()`.
  ); // Позволяет получить доступ к экземпляру `SplashCubit` во всем приложении.
}
