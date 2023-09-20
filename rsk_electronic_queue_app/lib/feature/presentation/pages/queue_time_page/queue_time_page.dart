import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

import 'widgets/menu.dart';

@RoutePage()
class QueueTimePage extends StatefulWidget {
  const QueueTimePage({super.key});

  @override
  State<QueueTimePage> createState() => _QueueTimePageState();
}

class _QueueTimePageState extends State<QueueTimePage> {
  // Duration timer = const Duration();

  // Значение, отображаемое в средстве выбора даты в режиме даты.
  // DateTime date = DateTime.now();

  // Значение, отображаемое в средстве выбора даты в режиме времени.
  // DateTime time = DateTime.now();

  // Значение, отображаемое в средстве выбора даты в режиме dateAndTime.
  DateTime dateTime = DateTime.now();

  // static List<String> getDaysOfWeek([String? locale]) {
  //   final now = DateTime.now();
  //   final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
  //   return List.generate(7, (index) => index)
  //       .map((value) => DateFormat(DateFormat.WEEKDAY, locale)
  //           .format(firstDayOfWeek.add(Duration(days: value))))
  //       .toList();
  // }

  void _showDemoPicker({
    required BuildContext context,
    required Widget child,
  }) {
    final themeData = CupertinoTheme.of(context);
    final dialogBody = CupertinoTheme(
      data: themeData,
      child: child,
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => dialogBody,
    );
  }

  @override
  Widget build(BuildContext context) {
    final queueTime = L10n.of(context).queueTime;
    final getTicket = L10n.of(context).getTicket;
    final selectDate = L10n.of(context).selectDate;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        // surfaceTintColor: AppColors.shadow,
        title: Text(
          queueTime,
          style: AppTextStyles.style16w600.copyWith(color: AppColors.onPrimary),
        ),
        leading: IconButton(
          icon: AppImages.arrowLeftBlack,
          onPressed: () => context.router.push(const ServiceTypeRoute()),
        ),
      ),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                  buttonColor: color.surfaceTint,
                  buttonText: selectDate,
                  fontColor: color.background,
                  stateButtonColor: color.onErrorContainer,
                  onButtonTap: () {
                    context.router.push(const QueueTimeRoute());
                  },
                  borderRadius: 10,
                  borderColor: color.primary,
                ),
                const Spacer(
                  flex: 6,
                ),
                DefaultTextStyle(
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                  child: Container(
                    child: _buildDateAndTimePicker(context),
                  ),
                ),
                const Spacer(),
                ButtonWidget(
                  buttonColor: color.surfaceTint,
                  buttonText: getTicket,
                  fontColor: color.background,
                  stateButtonColor: color.onErrorContainer,
                  onButtonTap: () {
                    context.router.push(const TicketRoute());
                  },
                  borderRadius: 10,
                  borderColor: color.primary,
                ),
              ]),
        ),
      ),
      // ),
    );
  }

  // mine
  Widget _buildDateAndTimePicker(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _showDemoPicker(
            context: context,
            // child: BottomPicker(
            child: CupertinoDatePicker(
              use24hFormat: true,
              minimumDate: dateTime,
              // minuteInterval: 1,
              maximumDate: DateTime(2023, 12, 30),
              // backgroundColor:
              //     CupertinoColors.systemBackground.resolveFrom(context),
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: dateTime,
              onDateTimeChanged: (newDateTime) {
                setState(() => dateTime = newDateTime);
              },
            ),
            // ),
          );
        },
        child: Menu(
          children: [
            // Text(GalleryLocalizations.of(context)!.demoCupertinoPickerDateTime),
            Flexible(
              child: Text(
                DateFormat.yMMMd().add_jm().format(dateTime),
                style: const TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
