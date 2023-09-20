part of '../splash_page.dart';

// Класс для рисования анимированной волны
class WavePainter extends CustomPainter {
  final AnimationController animationController;
  final bool isRightDirection;
  final double offsetY;
  final BuildContext context;

  static const int kWaveLength = 180;

  WavePainter({
    required this.animationController,
    required this.isRightDirection,
    required this.offsetY,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double xoffset = 1.2;
    final List<Offset> polygonOffsets = [];

    for (int i = (-xoffset * size.width).toInt();
        i <= xoffset * size.width;
        i++) {
      polygonOffsets.add(
        Offset(
          i.toDouble(),
          isRightDirection
              ? math.sin(vector.radians(i.toDouble() * 360 / kWaveLength) -
                          vector.radians(animationController.value)) *
                      20 -
                  -120 -
                  offsetY
              : math.sin(vector.radians(i.toDouble() * 600 / kWaveLength) +
                          vector.radians(animationController.value)) *
                      10 -
                  -120 -
                  offsetY,
        ),
      );
    }

    final Gradient gradient = LinearGradient(
      begin: const Alignment(-1.0, -1.7),
      end: const Alignment(-1.0, 3.0),
      colors: [
        Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        Theme.of(context).colorScheme.primary.withOpacity(0.6),
      ],
      stops: const [
        0.1,
        1,
      ],
    );

    final wave = Path();
    wave.addPolygon(polygonOffsets, false);
    wave.lineTo(xoffset * size.width, size.height);
    wave.lineTo(-xoffset * size.width, size.height);
    wave.close();

    final rect =
        Rect.fromLTWH(0.0, -size.height / 2, size.width, size.height / 2);

    final paintOutline = Paint()
      ..strokeWidth = 3
      ..color = Theme.of(context).colorScheme.inversePrimary
      ..style = PaintingStyle.stroke;
    canvas.drawPath(wave, paintOutline);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    canvas.drawPath(wave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
