import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors
              .errorContainer, // Цвет границы (взят из текущей темы приложения)
          width: 2, // Толщина границы
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 50,
      // width: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
