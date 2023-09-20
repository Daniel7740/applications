import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:vector_math/vector_math.dart' as vector;

import 'package:rsk_electronic_queue/di/service_locator.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/splash_page/cubit/splash_cubit.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

part 'widgets/wave.dart';
part 'widgets/animated_logo.dart';
part 'widgets/circle_clipper.dart';
part 'widgets/wave_painter.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController animationControllerLTR;
  late AnimationController animationControllerRTL;
  late AnimationController animationControllerBottomToTop;
  late AnimationController textAnimationController;

  @override
  void initState() {
    super.initState();
// Инициализация анимационных контроллеров
    animationControllerLTR = AnimationController(
      duration: const Duration(seconds: 3),
      lowerBound: 0,
      upperBound: 360,
      vsync: this,
    )..repeat();

    animationControllerRTL = AnimationController(
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 360,
      vsync: this,
    )..repeat();

    animationControllerBottomToTop = AnimationController(
      duration: const Duration(seconds: 5),
      lowerBound: 0,
      upperBound: 300,
      vsync: this,
    )..forward();

    textAnimationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    // Освобождение ресурсов анимационных контроллеров
    animationControllerLTR.dispose();
    animationControllerRTL.dispose();
    animationControllerBottomToTop.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = sl<SplashCubit>();
    final size = MediaQuery.of(context).size;

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocListener<SplashCubit, SplashStates>(
          bloc: cubit,
          listener: (context, state) {
            if (state is SplashAuthorizedState) {
              // Переход на экран с авторизацией
              context.router.pushAndPopUntil(const ServiceItemsRoute(),
                  predicate: (_) => false);
            }
            if (state is SplashUnauthorizedState) {
              // Переход на экран без авторизации
              context.router.pushAndPopUntil(const UnauthorizedRoute(),
                  predicate: (_) => false);
            }
          },
          child: AnimatedBuilder(
            animation: Listenable.merge([
              animationControllerLTR,
              animationControllerRTL,
              textAnimationController,
            ]),
            builder: (context, child) {
              return Stack(
                children: [
                  WaveElement(
                    animationPosinionController: animationControllerLTR,
                    waveDirection: true,
                    animationBottomTopController:
                        animationControllerBottomToTop,
                    size: size,
                  ),
                  WaveElement(
                    animationPosinionController: animationControllerRTL,
                    waveDirection: false,
                    animationBottomTopController:
                        animationControllerBottomToTop,
                    size: size,
                  ),
                  AnimatedLogo(
                    textAnimationController: textAnimationController,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
