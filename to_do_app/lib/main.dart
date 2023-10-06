import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/init_widget.dart';
import 'package:to_do_app/core/theme/provider.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());

  // Запрет на смену ориентации экрана
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TODO App',

          // Тема
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: context.watch<ThemeProvider>().themeMode,

          home: const HomeScreen(),
        );
      }),
    );
  }
}
