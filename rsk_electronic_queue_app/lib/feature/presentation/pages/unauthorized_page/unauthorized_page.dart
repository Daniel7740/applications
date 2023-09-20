import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/widgets/dialog_rsk_access.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/widgets/dialog_select_lang.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/widgets/lang_list.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/l10n/provider.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

part 'widgets/animated_text.dart';
part 'widgets/background_blue_animation.dart';
part 'widgets/button_language.dart';

@RoutePage()
class UnauthorizedPage extends StatefulWidget {
  const UnauthorizedPage({Key? key}) : super(key: key);

  @override
  State<UnauthorizedPage> createState() => _UnauthorizedPageState();
}

class _UnauthorizedPageState extends State<UnauthorizedPage>
    with TickerProviderStateMixin {
  late AnimationController landscapeAnimationController;
  late Animation<double> landscapeAnimation;
  double turn = 0;

  @override
  void initState() {
    super.initState();

    landscapeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    landscapeAnimation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: landscapeAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    landscapeAnimationController.addListener(() {
      setState(() {
        turn = landscapeAnimationController.value * 90;
      });
    });
  }

  @override
  void dispose() {
    landscapeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final allowRSKaccess = L10n.of(context).allowRSKaccess;
    final cancel = L10n.of(context).cancel;
    final allow = L10n.of(context).allow;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color.outline,
                  color.background,
                  color.tertiary,
                ],
                stops: const [0.0, 0.4, 0.9],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 28,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Синий прямоугольник
                    BackgrounBlueAnimation(
                        size: size,
                        turn: turn,
                        color: color,
                        landscapeAnimation: landscapeAnimation,
                        landscapeAnimationController:
                            landscapeAnimationController),

                    // Кнопка открытия меню смены локализации
                    const LangButton(),

                    // Контент
                    Positioned(
                      top: size.height / 2.3 - landscapeAnimation.value * 2,
                      child: Column(
                        children: [
                          // Текст с использованием анимации
                          const AnimatedText(),
                          const SizedBox(height: 56),

                          // Кнопка регистрации
                          ButtonWidget(
                            buttonColor: color.background,
                            buttonText: L10n.of(context).loginByPhone,
                            fontColor: color.primary,
                            stateButtonColor: color.primary.withOpacity(0.1),
                            onButtonTap: () {
                              context.router.push(const LoginRoute());
                            },
                            borderColor: color.primary,
                            borderRadius: 18,
                          ),
                          const SizedBox(height: 8),

                          // Кнопка Clien ID
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return MyAlertDialog(
                                    header: allowRSKaccess,
                                    cancel: cancel,
                                    allow: allow,
                                  );
                                },
                              );
                            },
                            child: Text(
                              L10n.of(context).requestClientid,
                              style: textStyle.labelMedium!.copyWith(
                                height: 1,
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          // Кнопка регистрации в кассу
                          ButtonWidget(
                            buttonColor: color.primary,
                            buttonText: L10n.of(context).signUpCashier,
                            fontColor: color.background,
                            stateButtonColor: color.onErrorContainer,
                            onButtonTap: () {
                              context.router.push(
                                const ServiceItemsRoute(),
                              );
                            },
                            borderColor: color.primary,
                            borderRadius: 18,
                          ),
                          const SizedBox(height: 8),

                          // Текст под кнопкой, разъясняющий её функцию
                          Text(
                            L10n.of(context).getServiceTicket,
                            style: textStyle.labelMedium!.copyWith(
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Облако
          Positioned(
            top: size.height / 8 + (landscapeAnimation.value / 5),
            left: size.width / 8 - 140 + (landscapeAnimation.value * 2.7),
            child: AppImages.cloud,
          ),

          // Горы
          Positioned(
            top: size.height / 1.3 - landscapeAnimation.value,
            right:
                size.width + 80 - size.width * 2 - (landscapeAnimation.value),
            child: AppImages.mountains,
          ),

          // Трава
          Positioned(
            top: size.height / 1.14 - landscapeAnimation.value + 20,
            left: size.width / 2 - size.width - (landscapeAnimation.value * 12),
            child: AppImages.grass,
          ),
        ],
      ),
    );
  }
}
