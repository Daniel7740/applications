part of 'dialog_select_lang.dart';

/// Этот код создает кнопку выбора языка, отображаемую с иконкой и названием языка. При нажатии на кнопку вызывается функция обратного вызова для изменения выбранного языка.

class LangButton extends StatelessWidget {
  const LangButton({
    Key? key, // Ключ виджета (key) может быть null
    required this.icon, // Обязательный параметр: иконка языка
    required this.lang, // Обязательный параметр: название языка
    required this.onChangeLang, // Обязательный параметр: функция обратного вызова при изменении языка
    required this.isSelected, // Обязательный параметр: флаг, указывающий, выбран ли язык
  }) : super(key: key);

  final Image icon; // Иконка языка
  final String lang; // Название языка
  final VoidCallback
      onChangeLang; // Функция обратного вызова при изменении языка
  final bool isSelected;
  // Флаг, указывающий, выбран ли язык
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChangeLang, // Функция обратного вызова при нажатии на кнопку
      child: Column(
        children: [
          icon, // Иконка языка
          const SizedBox(
            height: 8, // Вертикальный отступ между иконкой и текстом
          ),
          Text(
            lang, // Название языка
            // Стиль шрифта в зависимости от выбранного состояния
            style: isSelected
                ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 0.48,
                      height: 1,
                    )
                : Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 0.48,
                      height: 1,
                    ),
          ),
        ],
      ),
    );
  }
}
