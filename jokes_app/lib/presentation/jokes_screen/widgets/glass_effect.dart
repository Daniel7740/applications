import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEffectWidget extends StatelessWidget {
  const GlassEffectWidget({
    super.key,
    required this.widget,
    required this.verticalPadding,
    required this.horizontalPadding,
    this.isPressed = false,
  });

  final Widget widget;
  final double verticalPadding;
  final double horizontalPadding;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/WhiteNoise.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 0.03,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 25,
                spreadRadius: -5,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.outline,
            ),
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(isPressed ? 0.5 : 0.3),
          ),
          child: widget,
        ),
      ),
    );
  }
}
