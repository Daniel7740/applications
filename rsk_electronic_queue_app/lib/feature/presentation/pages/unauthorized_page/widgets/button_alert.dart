part of 'dialog_rsk_access.dart';

/// Этот код создает переиспользуемую кнопку с настраиваемыми параметрами, такими как текст, цвета, границы и функция обратного вызова при нажатии. Кнопка будет отображаться с заданным текстом и стилем.

class AlertButton extends StatelessWidget {
  const AlertButton({
    super.key, // Ключ виджета (super.key) не указан, возможно, ошибка в коде
    required this.text, // Обязательный параметр: текст кнопки
    required this.borderSider, // Обязательный параметр: границы кнопки
    required this.buttomColor, // Обязательный параметр: цвет кнопки
    required this.textColor, // Обязательный параметр: цвет текста на кнопке
    required this.onPressed, // Обязательный параметр: функция обратного вызова при нажатии на кнопку
  });

  final String text; // Текст кнопки
  final Color buttomColor; // Цвет кнопки
  final Color textColor; // Цвет текста на кнопке
  final BorderSide borderSider; // Границы кнопки
  final VoidCallback
      onPressed; // Функция обратного вызова при нажатии на кнопку

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed, // Функция обратного вызова при нажатии на кнопку
      height: 32, // Высота кнопки
      minWidth: 108, // Минимальная ширина кнопки
      color: buttomColor, // Цвет кнопки
      elevation: 0, // Высота тени кнопки
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Скругление углов кнопки
        side: borderSider, // Границы кнопки
      ),
      child: Text(
        text, // Текст на кнопке
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: textColor, // Цвет текста
              height: 1.4, // Межстрочный интервал
            ),
      ),
    );
  }
}
