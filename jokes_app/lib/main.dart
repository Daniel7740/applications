import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/core/theme/theme.dart';
import 'package:jokes/core/theme/theme_provider.dart';
import 'package:jokes/init_widget.dart';
import 'package:provider/provider.dart';

import 'presentation/jokes_screen/jokes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jokes from dad',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: context.watch<ThemeProvider>().themeMode,
          home: const JokeScreen(),
        );
      }),
    );
  }
}
