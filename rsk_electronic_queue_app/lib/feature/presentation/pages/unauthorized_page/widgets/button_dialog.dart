import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
    required this.buttonColor,
    required this.onButtonTap,
    required this.textColor,
    required this.buttonText,
  }) : super(key: key);

  final Color buttonColor;
  final VoidCallback onButtonTap;
  final Color textColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap, // Событие по нажатию на кнопку
      child: Container(
        constraints: const BoxConstraints(minWidth: 108),
        decoration: BoxDecoration(
          color: buttonColor, // Цвет кнопки
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 8, horizontal: MediaQuery.of(context).size.width / 30),
          child: Text(
            buttonText, // Текст кнопки (получен из локализации),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  height: 1.17,
                  letterSpacing: 0.42,
                  color: textColor, // Цвет текста
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
