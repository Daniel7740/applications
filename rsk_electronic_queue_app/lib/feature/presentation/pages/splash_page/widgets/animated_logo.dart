// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../splash_page.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required this.textAnimationController,
  }) : super(key: key);

  final AnimationController textAnimationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textAnimationController,
      builder: (context, child) {
        return Opacity(
          opacity: textAnimationController.value,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImages.rskLogo,
                const SizedBox(
                  width: 6,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      L10n.of(context).rsk.toUpperCase(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      L10n.of(context).morePossibilities,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(height: 1, letterSpacing: 0.14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
