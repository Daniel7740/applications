import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/theme/provider.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Провайдер для управления темой приложения
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: child,
    );
  }
}
