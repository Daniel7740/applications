part of '../jokes_screen.dart';

class _TimerWidget extends StatefulWidget {
  const _TimerWidget({
    required this.isLoaded,
  });

  final bool isLoaded;

  @override
  State<_TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<_TimerWidget> {
  Timer? timer;
  final int time = 60;
  final showTime = ValueNotifier<int>(0);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _TimerWidget oldWidget) {
    if (widget.isLoaded) {
      timer?.cancel();
      startTimer();
    } else {
      timer?.cancel();
      showTime.value = time;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    showTime.dispose();
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (tick) async {
        showTime.value = time - tick.tick;
        if (showTime.value == 0) {
          showTime.value == time;
          timer?.cancel();
          await context.read<JokesCubit>().getQuestion();
          startTimer();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showTime,
        builder: (context, _, __) {
          return GlassEffectWidget(
              widget: Text(
                showTime.value.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              verticalPadding: 0,
              horizontalPadding: 35);
        });
  }
}
