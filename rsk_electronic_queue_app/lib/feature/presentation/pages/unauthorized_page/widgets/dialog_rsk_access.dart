import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/widgets/button_dialog.dart';

part 'button_alert.dart';

/// Этот код создает диалоговое окно с оповещением, содержащее заголовок, изображение и кнопки. Окно отображается с заданными размерами и стилем.

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog(
      {super.key,
      required this.header,
      required this.cancel,
      required this.allow}); // Конструктор диалогового окна

  final String header, cancel, allow;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0), // Внутренний отступ окна
      elevation: 0.0, // Уровень подъема окна
      backgroundColor: Colors.transparent, // Прозрачный фон окна
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.77, // Ширина контейнера, определенная относительно ширины экрана
        height: 158, // Высота контейнера
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .background, // Цвет фона контейнера (взят из текущей цветовой схемы приложения)
          borderRadius: const BorderRadius.all(
            Radius.circular(8), // Скругление углов контейнера
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  /// Иконка (крестик)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Navigator.pop(
                          context), // Функция обратного вызова при нажатии на иконку закрытия окна
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: AppImages.close,
                      ),
                    ),
                  ),

                  /// Текст - запрос разрешения
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      header, // Текст заголовка окна (получен из локализации)
                      textAlign:
                          TextAlign.center, // Выравнивание текста по центру
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground, // Цвет текста (взят из текущей цветовой схемы приложения)
                            height: 1.4, // Межстрочный интервал текста
                          ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              /// Кнопки
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Кнопка "отмена"
                  DialogButton(
                    buttonColor: Theme.of(context).colorScheme.background,
                    onButtonTap: () => Navigator.pop(context),
                    textColor: Theme.of(context).colorScheme.primary,
                    buttonText: cancel,
                  ),
                  // Кнопка "разрешить"
                  DialogButton(
                    buttonColor: Theme.of(context).colorScheme.primary,
                    onButtonTap: () => Navigator.pop(context),
                    textColor: Theme.of(context).colorScheme.background,
                    buttonText: allow,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
