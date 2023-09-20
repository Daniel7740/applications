import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/widgets/lang_list.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/l10n/provider.dart';

part 'change_lang_button.dart';

/// Этот код создает диалоговое окно для выбора языка.
/// Окно содержит список доступных языков с их флагами и полными названиями.
/// Пользователь может выбрать язык, и при выборе происходит изменение языка приложения.

class DialogSelectLanguage extends StatelessWidget {
  final double width;
  final double height;

  const DialogSelectLanguage({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final cw = context.watch<
        LocaleProvider>(); // Чтение текущего выбранного языка с помощью провайдера
    final cr =
        context.read<LocaleProvider>(); // Чтение провайдера для изменения языка

    return Dialog(
      insetPadding: const EdgeInsets.all(0), // Внутренний отступ окна
      elevation: 0.0, // Уровень подъема окна
      backgroundColor: Colors.transparent, // Прозрачный фон окна
      child: Container(
        width: width, // Ширина контейнера
        height: height, // Высота контейнера
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .background, // Цвет фона контейнера (взят из текущей цветовой схемы приложения)
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(
                30), // Скругление нижнего правого угла контейнера
            bottomLeft: Radius.circular(
                30), // Скругление нижнего левого угла контейнера
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  L10n.of(context)
                      .chooseLanguage, // Текст заголовка окна (получен из локализации)
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Цвет текста заголовка (взят из текущей цветовой схемы приложения)
                        letterSpacing: 0.56,
                        height: 1,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Language.languageList().map(
                  (language) {
                    return LangButton(
                      icon: language.flag, // Иконка языка
                      lang: language.fullName, // Полное название языка
                      isSelected: cw.currentLocale ==
                          Locale(language.languageCode), // Выбранный язык
                      onChangeLang: () {
                        cr.changeLanguage(
                            language.id); // Изменение языка при выборе
                        Navigator.pop(context); // Закрытие диалогового окна
                      },
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
