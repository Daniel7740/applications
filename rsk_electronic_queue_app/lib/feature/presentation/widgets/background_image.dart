import 'package:flutter/material.dart';

import 'package:rsk_electronic_queue/core/theme/images.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AppAssetImages.landscape, // Устанавливаем фоновое изображение
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
