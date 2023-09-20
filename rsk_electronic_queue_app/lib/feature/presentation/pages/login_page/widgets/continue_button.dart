part of '../login_page.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.isButtonEnabled,
    required this.color,
    required this.l10n,
    required this.textEditingController,
  }) : super(key: key);

  final bool isButtonEnabled;
  final ColorScheme color;
  final L10n l10n;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.router.push(
            SMSCodeRoute(
              phoneNumber: textEditingController.text,
            ),
          );
        }
      },
      builder: (context, state) {
        return ButtonWidget(
          buttonColor: isButtonEnabled ? color.primary : color.background,
          buttonText: l10n.continueWord,
          fontColor: isButtonEnabled ? color.background : color.onPrimary,
          stateButtonColor:
              isButtonEnabled ? color.onErrorContainer : color.background,
          onButtonTap: isButtonEnabled
              ? () async {
                  BlocProvider.of<LoginCubit>(context).getSMS(
                    phone: textEditingController.text,
                  );
                  // Навигация к другому маршруту при нажатии кнопки
                }
              : () {},
          borderRadius: 18,
          borderColor: isButtonEnabled ? color.primary : color.shadow,
        );
      },
    );
  }
}
