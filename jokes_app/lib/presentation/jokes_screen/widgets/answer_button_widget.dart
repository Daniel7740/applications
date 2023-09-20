part of '../jokes_screen.dart';

class _AnswerButtonWidget extends StatefulWidget {
  const _AnswerButtonWidget({required this.question});

  final String question;

  @override
  State<_AnswerButtonWidget> createState() => _AnswerButtonWidgetState();
}

class _AnswerButtonWidgetState extends State<_AnswerButtonWidget>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(covariant _AnswerButtonWidget oldWidget) {
    if (widget.question != oldWidget.question) {
      setState(() {
        showAnswer = false;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  bool showAnswer = false;
  bool isPressed = false;
  Key answerKey = UniqueKey();

  void showAns() {
    setState(() {
      showAnswer = true;
      answerKey = UniqueKey();
    });
  }

  void pressed() {
    setState(() {
      isPressed = true;
    });
  }

  void unpressed() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAns();
      },
      onTapDown: (_) {
        pressed();
      },
      onTapUp: (_) {
        unpressed();
      },
      child: GlassEffectWidget(
        isPressed: isPressed,
        widget: AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: showAnswer
              ? Text(
                  widget.question,
                  key: answerKey,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.justify,
                )
              : Text(
                  'Show answer',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
        ),
        verticalPadding: 14,
        horizontalPadding: 40,
      ),
    );
  }
}
