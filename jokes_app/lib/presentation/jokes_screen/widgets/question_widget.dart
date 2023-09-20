part of '../jokes_screen.dart';

class _QuestionWidget extends StatefulWidget {
  const _QuestionWidget({
    required this.question,
    required this.isLoading,
  });

  final String question;
  final bool isLoading;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<_QuestionWidget> {
  bool isRequesting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanUpdate: (details) {
        if (details.delta.dx < 0 && !isRequesting) {
          if (!widget.isLoading) {
            setState(() {
              isRequesting = true;
            });
            context.read<JokesCubit>().getQuestion().then(
              (_) {
                setState(
                  () {
                    isRequesting = false;
                  },
                );
              },
            );
          }
        }
      },
      child: Container(
        constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: MediaQuery.of(context).size.height / 4),
        child: GlassEffectWidget(
          horizontalPadding: 24,
          verticalPadding: 22,
          widget: Column(
            children: [
              Text(
                'Joke'.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              if (!widget.isLoading)
                Text(
                  widget.question,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              if (widget.isLoading)
                SpinKitThreeBounce(
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30.0,
                ),
              const SizedBox(
                height: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
