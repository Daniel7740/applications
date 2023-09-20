import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jokes/core/cubits/jokes_cubit.dart';
import 'package:jokes/core/theme/theme_provider.dart';
import 'package:jokes/presentation/jokes_screen/widgets/check_internet_connection.dart';
import 'package:jokes/presentation/jokes_screen/widgets/glass_effect.dart';
import 'package:lottie/lottie.dart';

part '../jokes_screen/widgets/app_bar.dart';
part '../jokes_screen/widgets/timer_widget.dart';
part '../jokes_screen/widgets/question_widget.dart';
part '../jokes_screen/widgets/answer_button_widget.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            themeProvider.themeMode == ThemeMode.light
                ? 'assets/images/light_luke.png'
                : 'assets/images/dark_vader.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: const _AppBar(),
        body: FutureBuilder<bool>(
          future: checkInternetConnectivity(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final isConnected = snapshot.data!;
              if (isConnected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: BlocBuilder<JokesCubit, JokeStates>(
                    builder: (context, state) {
                      return Center(
                        child: Column(
                          children: [
                            const Spacer(),
                            _TimerWidget(
                              isLoaded: state is SuccessState,
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            _QuestionWidget(
                              question: state.joke.question,
                              isLoading: state is LoadingState,
                            ),
                            const Spacer(),
                            if (state.joke.answer.isNotEmpty ||
                                state is LoadingState)
                              _AnswerButtonWidget(
                                question: state.joke.answer,
                              ),
                            const Spacer(
                              flex: 7,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: GlassEffectWidget(
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/lottie/no-internet-animation.json',
                          width: MediaQuery.of(context).size.width / 1.5,
                        ),
                        Text(
                          'No internet connection',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    verticalPadding: 0,
                    horizontalPadding: 25,
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error while checking internet connection',
                ),
              );
            } else {
              return Center(
                child: SpinKitThreeBounce(
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30.0,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
