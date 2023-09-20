import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

@RoutePage()
class SMSCodePage extends StatefulWidget {
  final String phoneNumber;

  const SMSCodePage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<SMSCodePage> createState() => _SMSCodePageState();
}

class _SMSCodePageState extends State<SMSCodePage> {
  final textEditingController = TextEditingController();
  bool isTextVisible = false; // Флаг, определяющий видимость текста
  final isButtonEnabled = ValueNotifier<bool>(false); // Флаг активации кнопки

  @override
  void initState() {
    super.initState();
    textEditingController.text = '';
    textEditingController.addListener(() {
      if (textEditingController.text.length == 6) {
        isButtonEnabled.value = true;
      } else {
        isButtonEnabled.value = false;
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    isButtonEnabled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numberFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = L10n.of(context);

    // Возвращаем виджет GestureDetector, чтобы обработать нажатие вне текстового поля
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Скрываем клавиатуру при нажатии вне текстового поля
      },
      child: BackgroundImage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              width: 288,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Текст сообщение отправленно на...
                  SizedBox(
                    width: 288,
                    child: Text(
                      '${l10n.codeSendToPhone} + 996 ${widget.phoneNumber}', // Отображаем текст с номером телефона
                      style: textTheme.bodyMedium!.copyWith(
                        height: 1.6,
                        letterSpacing: 0.36,
                        color: color.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Текстовое поле ввода кода
                  TextField(
                    controller:
                        textEditingController, // Привязываем контроллер для текстового поля
                    inputFormatters: [
                      numberFormatter
                    ], // Устанавливаем форматтер для ввода только чисел
                    textAlignVertical: TextAlignVertical.bottom,
                    obscureText:
                        !isTextVisible, // Скрываем текст, если флаг isTextVisible равен false
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isTextVisible =
                                !isTextVisible; // Изменяем флаг isTextVisible при нажатии на иконку
                          });
                        },
                        icon: isTextVisible
                            ? AppImages.eyeOpen
                            : AppImages
                                .eyeClose, // Используем разные иконки в зависимости от значения флага
                      ),
                      hintText: '___ ___', // Подсказка для ввода кода
                      prefixStyle: textTheme.labelMedium!.copyWith(
                        color: color.onTertiary,
                        height: 1.17,
                        letterSpacing: 0.42,
                      ),
                      labelText:
                          l10n.enterCode, // Текст метки для текстового поля
                      labelStyle: textTheme.labelMedium!.copyWith(
                        color: color.primary,
                        height: 1.17,
                        letterSpacing: 0.42,
                      ),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    maxLength:
                        6, // Максимальное количество символов в текстовом поле
                    keyboardType: TextInputType.number, // Клавиатура с числами
                    autofocus: true, // Автофокус на текстовом поле
                    style: textTheme.labelMedium!.copyWith(
                      color: color.onTertiary,
                      height: 1.17,
                      letterSpacing: 0.42,
                    ),
                    onChanged: (_) {
                      setState(() {
                        textEditingController.value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ButtonWidget(
                    buttonColor: isButtonEnabled.value
                        ? color.primary
                        : color.background,
                    buttonText: l10n.continueWord,
                    fontColor: isButtonEnabled.value
                        ? color.background
                        : color.onPrimary,
                    stateButtonColor: isButtonEnabled.value
                        ? color.onErrorContainer
                        : color.background,
                    onButtonTap: isButtonEnabled.value
                        ? () {
                            context.router.pushAndPopUntil(
                                const ServiceItemsRoute(),
                                predicate: (_) =>
                                    false); // Навигация к другому маршруту при нажатии кнопки
                          }
                        : () {},
                    borderRadius: 18,
                    borderColor:
                        isButtonEnabled.value ? color.primary : color.shadow,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
