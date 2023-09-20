part of '../unauthorized_page.dart';

/// Этот код отображает два текста, правая часть текста использует анимацию

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          L10n.of(context).onlineQueue, // Отображение текста "Онлайн-очередь"
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.primary, height: 1.17),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 110,
          child: AnimatedDefaultTextStyle(
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary, height: 1.17),
            duration: const Duration(milliseconds: 500),
            child: AnimatedTextKit(
              isRepeatingAnimation:
                  true, // Флаг, указывающий, что анимация будет повторяться
              pause: const Duration(
                  milliseconds:
                      0), // Длительность паузы между анимациями (в данном случае 0 миллисекунд)
              repeatForever:
                  true, // Флаг, указывающий, что анимация будет бесконечно повторяться
              animatedTexts: [
                FadeAnimatedText(
                  L10n.of(context).comfortable, // Анимированный текст "Удобно"
                ),
                FadeAnimatedText(
                  L10n.of(context).simply, // Анимированный текст "Просто"
                ),
                FadeAnimatedText(
                  L10n.of(context).fast, // Анимированный текст "Быстро"
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
