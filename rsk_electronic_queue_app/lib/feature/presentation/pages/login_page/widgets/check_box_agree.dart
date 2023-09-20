part of '../login_page.dart';

class CheckBoxAgree extends StatelessWidget {
  const CheckBoxAgree({
    Key? key,
    required this.color,
    required this.l10n,
    required this.textStyle,
    required this.isChecked,
    required this.onTapCheckbox,
  }) : super(key: key);

  final ColorScheme color;
  final L10n l10n;
  final TextTheme textStyle;
  final bool isChecked;
  final VoidCallback onTapCheckbox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCheckbox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.all(0),
            child: Checkbox(
              value: isChecked, // Устанавливаем значение чекбокса
              onChanged: (_) =>
                  onTapCheckbox(), // Обработчик изменения состояния чекбокса
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              visualDensity: VisualDensity.compact,
              activeColor: color.primary,
              checkColor: color.background,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              l10n.personalData,
              style: textStyle.labelMedium?.copyWith(
                color: color.shadow,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
