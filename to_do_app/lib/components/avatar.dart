// Аватарка
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: CircleAvatar(
            minRadius: 58,
            maxRadius: 58,
            child: Container(
              color: color.secondary,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: CircleAvatar(
            minRadius: 55,
            maxRadius: 55,
            child: Container(
              color: color.primary,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: CircleAvatar(
            minRadius: 50,
            maxRadius: 50,
            child: Image.asset(
              'assets/images/avatar.jpg',
            ),
          ),
        ),
      ],
    );
  }
}
