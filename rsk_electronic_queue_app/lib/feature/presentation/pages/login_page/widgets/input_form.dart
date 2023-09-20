part of '../login_page.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.textEditingController,
    required this.textStyle,
    required this.color,
    required this.l10n,
    required this.onTextChanged,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final TextTheme textStyle;
  final ColorScheme color;
  final L10n l10n;
  final Function onTextChanged;

  @override
  Widget build(BuildContext context) {
    final numberFormatter = FilteringTextInputFormatter.allow(RegExp(
        r'[0-9]')); // Форматтер для текстового поля, разрешающий только ввод цифр

    return SizedBox(
      height: 40,
      child: TextField(
        controller:
            textEditingController, // Привязываем контроллер для текстового поля
        inputFormatters: [
          numberFormatter
        ], // Устанавливаем форматтер для ввода только чисел
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: '___ ___ ___', // Подсказка для ввода номера телефона
          prefixText: '+996', // Префиксный текст перед номером телефона
          prefixStyle: textStyle.labelMedium!.copyWith(
            color: color.onTertiary,
            height: 1.17,
            letterSpacing: 0.42,
          ),
          labelText: l10n.enterNumber, // Текст метки для текстового поля
          labelStyle: textStyle.labelMedium!.copyWith(
            color: color.primary,
            height: 1.17,
            letterSpacing: 0.42,
          ),
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        maxLength: 9, // Максимальное количество символов в текстовом поле
        keyboardType: TextInputType.number, // Клавиатура с числами
        autofocus: true, // Автофокус на текстовом поле
        style: textStyle.labelMedium!.copyWith(
          color: color.onTertiary,
          height: 1.17,
          letterSpacing: 0.42,
        ),
        onChanged: (_) =>
            onTextChanged(), // Обработчик изменений в текстовом поле
      ),
    );
  }
}
