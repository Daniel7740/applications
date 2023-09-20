import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsk_electronic_queue/core/theme/provider.dart';
import 'package:rsk_electronic_queue/l10n/provider.dart';

/// Виджет, используемый для инициализации провайдеров в приложении.

class InitWidget extends StatelessWidget {
  const InitWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Виджет, позволяющий объединить несколько провайдеров в один родительский виджет.
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) =>
              ThemeProvider(), // Провайдер для управления темой приложения
        ),
        ChangeNotifierProvider<LocaleProvider>(
          create: (context) =>
              LocaleProvider(), // Провайдер для управления локализацией приложения с использованием
        ),
      ],
      child:
          child, // Дочерний виджет child будет доступен для всех дочерних виджетов внутри MultiProvider, которые могут использовать и обновлять значения, предоставляемые провайдерами.
    );
  }
}
