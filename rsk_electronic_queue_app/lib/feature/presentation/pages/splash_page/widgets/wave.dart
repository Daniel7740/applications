part of '../splash_page.dart';

class WaveElement extends StatelessWidget {
  const WaveElement({
    Key? key,
    required this.animationPosinionController,
    required this.animationBottomTopController,
    required this.waveDirection,
    required this.size,
  }) : super(key: key);

  final AnimationController animationPosinionController;
  final AnimationController animationBottomTopController;
  final bool waveDirection;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height / 2,
      left: size.width / 2,
      child: ClipPath(
        clipper: CircleClipper(),
        child: CustomPaint(
          size: const Size(300, 300),
          painter: WavePainter(
            animationController: animationPosinionController,
            isRightDirection: waveDirection,
            offsetY: animationBottomTopController.value,
            context: context,
          ),
        ),
      ),
    );
  }
}
