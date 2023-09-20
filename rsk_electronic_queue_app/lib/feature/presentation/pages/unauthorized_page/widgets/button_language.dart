part of '../unauthorized_page.dart';

/// Кнопка по нажатию открывающая панель с выбором локализации

class LangButton extends StatefulWidget {
  const LangButton({super.key});

  @override
  State<LangButton> createState() => _LangButtonState();
}

// Приватный класс _LangButtonState, расширяющий State<LangButton>
class _LangButtonState extends State<LangButton> {
  @override
  Widget build(BuildContext context) {
    // Определение выбранного языка на основе текущего языка, выбранного в LocaleProvider
    Language selectedLanguage = Language.languageList().firstWhere(
        (language) =>
            language.languageCode ==
            context.watch<LocaleProvider>().currentLocale.languageCode,
        orElse: () => Language.languageList().first);

    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          // Отображение диалогового окна для выбора языка
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 0.17,
                  child: DialogSelectLanguage(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
          );
        },
        child: SizedBox(
          width: 35,
          height: 28,
          child: Row(
            children: [
              Text(
                selectedLanguage.name, // Отображение имени выбранного языка
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(letterSpacing: 0.42),
              ),
              const SizedBox(
                width: 4,
              ),
              AppImages.down,
            ],
          ),
        ),
      ),
    );
  }
}
