// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../unauthorized_page.dart';

class BackgrounBlueAnimation extends StatelessWidget {
  const BackgrounBlueAnimation({
    Key? key,
    required this.size,
    required this.turn,
    required this.color,
    required this.landscapeAnimation,
    required this.landscapeAnimationController,
  }) : super(key: key);

  final Size size;
  final double turn;
  final ColorScheme color;
  final Animation landscapeAnimation;
  final AnimationController landscapeAnimationController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height / 2.3 - landscapeAnimation.value * 2,
      child: AnimatedBuilder(
        animation: landscapeAnimationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: turn * (3.14 / 180),
            child: Transform.translate(
              offset: const Offset(0, 0),
              child: Container(
                width: size.width / 2 -
                    50 +
                    (landscapeAnimation.value + size.width / 20) *
                        landscapeAnimationController.value,
                height: size.height / 4 -
                    50 +
                    (landscapeAnimation.value + size.height / 7) *
                        landscapeAnimationController.value,
                decoration: BoxDecoration(
                  color: color.outlineVariant
                      .withOpacity(0.8 * landscapeAnimationController.value),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: color.primary.withOpacity(
                          0.2 * landscapeAnimationController.value),
                      blurRadius: 24,
                      spreadRadius: -1,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
