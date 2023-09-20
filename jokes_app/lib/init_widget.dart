import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/core/cubits/jokes_cubit.dart';
import 'package:jokes/core/network/dio_settings.dart';
import 'package:jokes/core/network/repository/jokes_repository.dart';
import 'package:jokes/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final themeProvider = ThemeProvider();

          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (context) => DioSettings(),
              ),
              RepositoryProvider(
                create: (context) => JokesRepositoryImpl(
                  dio: context.read<DioSettings>().dio,
                ),
              ),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                  value: themeProvider,
                ),
              ],
              child: BlocProvider(
                create: (BuildContext context) => JokesCubit(
                  repo: context.read<JokesRepositoryImpl>(),
                )..getQuestion(),
                child: child,
              ),
            ),
          );
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
