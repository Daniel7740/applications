// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// Этот код создает переиспользуемую кнопку с настраиваемыми параметрами, такими как цвета, текст и функция обратного вызова при нажатии. Кнопка реагирует на события нажатия и отпускания, обновляя свой внешний вид и вызывая функцию обратного вызова при необходимости.

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    Key? key, // Ключ виджета (key) может быть null
    required this.buttonColor,
    required this.buttonText,
    required this.fontColor,
    required this.stateButtonColor,
    required this.borderColor,
    required this.borderRadius,
    this.icons,
    required this.onButtonTap,
  }) : super(key: key);

  final Color buttonColor; // Цвет кнопки
  final String buttonText; // Текст кнопки
  final Color fontColor; // Цвет шрифта на кнопке
  final Color stateButtonColor; // Цвет кнопки при нажатии
  final VoidCallback
      onButtonTap; // Функция обратного вызова при нажатии на кнопку
  final Color borderColor;
  final double borderRadius;
  final Image? icons;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isButtonPressed = false; // Флаг, определяющий, нажата ли кнопка

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // Обработчик нажатия кнопки
        setState(() {
          isButtonPressed = true; // Установка флага нажатия кнопки
        });
      },
      onTapUp: (_) {
        // Обработчик отпускания кнопки
        setState(() {
          isButtonPressed = false; // Сброс флага нажатия кнопки
        });
      },
      onTapCancel: () {
        // Обработчик отмены нажатия кнопки
        setState(() {
          isButtonPressed = false; // Сброс флага нажатия кнопки
        });
      },
      onTap:
          widget.onButtonTap, // Функция обратного вызова при нажатии на кнопку
      child: Container(
        constraints: const BoxConstraints(minWidth: 288),
        // width: MediaQuery.of(context).size.width /
        //     1.43, // Ширина контейнера равна ширине экрана
        decoration: BoxDecoration(
          color: isButtonPressed
              ? Colors.transparent
              : widget
                  .buttonColor, // Цвет фона контейнера (прозрачный при нажатии)
          border: Border.all(
            color: widget
                .borderColor, // Цвет границы (взят из текущей темы приложения)
            width: 1, // Толщина границы
          ),
          borderRadius: BorderRadius.circular(
              widget.borderRadius), // Скругление углов контейнера
          boxShadow: [
            BoxShadow(
              color: widget.stateButtonColor, // Цвет тени при нажатии
            ),
            BoxShadow(
              color: widget.buttonColor, // Цвет тени
              blurRadius: 3, // Радиус размытия тени
              spreadRadius: -4, // Распространение тени
              offset: const Offset(0, -3.5), // Смещение тени
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16, // Внутренний отступ сверху и снизу
          ),
          child: Text(
            widget.buttonText, // Текст на кнопке
            textAlign: TextAlign.center, // Выравнивание текста по центру
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  letterSpacing: 0.42,
                  color: widget.fontColor, // Цвет текста
                ),
          ),
        ),
      ),
    );
  }
}
