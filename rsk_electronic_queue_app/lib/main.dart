import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:rsk_electronic_queue/di/service_locator.dart' as di;
import 'package:rsk_electronic_queue/firebase_options.dart';
import 'package:rsk_electronic_queue/init_widget.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/l10n/provider.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

import 'core/theme/provider.dart';
import 'core/theme/theme.dart';

void main() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then;
  await di.init();
  runApp(const MyApp());

  /// Запрет на смену ориентации экрана
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'RSK Electronic queue',

            /// Theme
            theme: Themes.light,
            darkTheme: Themes.light,
            themeMode: context.watch<ThemeProvider>().themeMode,

            /// Localization
            locale: context.watch<LocaleProvider>().currentLocale,
            supportedLocales: L10n.delegate.supportedLocales,
            localizationsDelegates: const [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            /// Routes
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
