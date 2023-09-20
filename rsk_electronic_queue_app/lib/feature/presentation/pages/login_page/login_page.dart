import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsk_electronic_queue/core/network/dio_settings.dart';
import 'package:rsk_electronic_queue/feature/data/repositories/auth_repo_impl.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/login_page/cubit/login_cubit.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

// Импорт виджетов, используемых внутри этого файла
part 'widgets/input_form.dart';
part 'widgets/continue_button.dart';
part 'widgets/check_box_agree.dart';

// Определение страницы маршрута с использованием аннотации @RoutePage
@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Определение состояния для виджета LoginPage
class _LoginPageState extends State<LoginPage> {
  bool isChecked = false; // Флаг выбора чекбокса
  final numberFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  final textEditingController = TextEditingController();
  bool isButtonEnabled = false; // Флаг активации кнопки

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(
        onTextChanged); // Добавляем обработчик изменений в текстовом поле
  }

  // Обработчик изменений в текстовом поле
  void onTextChanged() {
    setState(() {
      isButtonEnabled = isChecked &&
          textEditingController.text.length ==
              9; // Проверяем условие для активации кнопки
    });
  }

  // Обработчик нажатия на чекбокс
  void onTapCheckbox() {
    setState(() {
      isChecked = !isChecked; // Инвертируем флаг выбора чекбокса
      isButtonEnabled = isChecked &&
          textEditingController.text.length ==
              9; // Проверяем условие для активации кнопки
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final l10n = L10n.of(context);

    // Возвращаем виджет GestureDetector, чтобы обработать нажатие вне текстового поля
    return BlocProvider(
      create: (context) =>
          LoginCubit(authRepo: AuthRepoImpl(dio: DioSettings().dio)),
      child: GestureDetector(
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
                    // Текстовое поле для ввода номера
                    InputForm(
                        textEditingController: textEditingController,
                        textStyle: textStyle,
                        color: color,
                        l10n: l10n,
                        onTextChanged: onTextChanged),

                    const SizedBox(height: 25),
                    // Виджет кнопки с условием активации
                    ContinueButton(
                        isButtonEnabled: isButtonEnabled,
                        color: color,
                        l10n: l10n,
                        textEditingController: textEditingController),

                    const SizedBox(height: 16),
                    // Виджет чекбокса с текстом
                    CheckBoxAgree(
                        color: color,
                        l10n: l10n,
                        textStyle: textStyle,
                        isChecked: isChecked,
                        onTapCheckbox: onTapCheckbox),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
