import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/widgets/dialog_rsk_access.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

@RoutePage()
class YourTicketPage extends StatefulWidget {
  const YourTicketPage({super.key});

  @override
  State<YourTicketPage> createState() => _YourTicketPageState();
}

class _YourTicketPageState extends State<YourTicketPage> {
  @override
  Widget build(BuildContext context) {
    final yourTicket = L10n.of(context).yourTicket;
    final printTicket = L10n.of(context).printTicket;
    final streetM = L10n.of(context).streetM;
    final dateVisit = L10n.of(context).dateVisit;
    final address = L10n.of(context).address;
    final codeActivation = L10n.of(context).codeActivation;
    final serviceType = L10n.of(context).serviceType;
    final cancelQueue = L10n.of(context).cancelQueue;
    final yes = L10n.of(context).yes;
    final no = L10n.of(context).no;

    final scanQR = L10n.of(context).scanQR;
    final transferlEntry = L10n.of(context).transferlEntry;
    final cancelEntry = L10n.of(context).cancelEntry;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        // surfaceTintColor: AppColors.shadow,
        title: Text(
          yourTicket,
          style: AppTextStyles.style16w600.copyWith(color: AppColors.onPrimary),
        ),
        leading: IconButton(
            icon: AppImages.arrowLeftBlack,
            onPressed: () => false //context.router.push(const TicketRoute()),
            ),
      ),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              // AppImages.info,
              Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppImages.info,
                      Expanded(
                        child: Text(
                          printTicket,
                          style: AppTextStyles.style16w400
                              .copyWith(color: AppColors.outline),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, right: 25, left: 20, bottom: 40),
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.onTertiaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15.0, // смягчить тень
                          spreadRadius: 5.0, //расширить тень
                          offset: Offset(
                            5.0, // Сдвинуть вправо 5 по горизонтали
                            5.0, // Сдвинуть вправо 5 по Вертикально
                          ),
                        )
                      ],
                    ),
                    child: _yourTicket(codeActivation, address, streetM,
                        dateVisit, serviceType),
                  ),
                  const Spacer(),
                  ButtonWidget(
                    buttonColor: color.primary,
                    buttonText: scanQR,
                    icons: AppImages.qr,
                    fontColor: color.background,
                    stateButtonColor: color.onErrorContainer,
                    onButtonTap: () {
                      context.router.push(const QRcodViewRoute());
                    },
                    borderRadius: 10,
                    borderColor: color.primary,
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    buttonColor: color.background,
                    buttonText: cancelEntry,
                    fontColor: color.primary,
                    stateButtonColor: color.onErrorContainer,
                    onButtonTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MyAlertDialog(
                            header: cancelQueue,
                            cancel: yes,
                            allow: no,
                          );
                        },
                      );
                    },
                    borderRadius: 10,
                    borderColor: color.primary,
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    buttonColor: color.background,
                    buttonText: transferlEntry,
                    fontColor: color.primary,
                    stateButtonColor: color.onErrorContainer,
                    onButtonTap: () {
                      context.router.push(const QueueTimeRoute());
                    },
                    borderRadius: 10,
                    borderColor: color.primary,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          //   ],
          // ),
        ),
      ),
    );
  }

  Column _yourTicket(String codeActivation, String address, String streetM,
      String dateVisit, String serviceType) {
    return Column(
      children: [
        Text(
          codeActivation,
          style: AppTextStyles.style14w500.copyWith(color: AppColors.onPrimary),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                AppImages.location,
                const SizedBox(width: 20),
                Text(
                  address,
                  style: AppTextStyles.style14w500
                      .copyWith(color: AppColors.onPrimary),
                ),
              ],
            ),
            Text(
              streetM,
              style: AppTextStyles.style12w400
                  .copyWith(color: AppColors.onPrimary),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                AppImages.calendar,
                const SizedBox(width: 20),
                Text(
                  dateVisit,
                  style: AppTextStyles.style14w500
                      .copyWith(color: AppColors.onPrimary),
                ),
              ],
            ),
            Text(
              "Сегодня 14:00",
              style: AppTextStyles.style12w400
                  .copyWith(color: AppColors.onPrimary),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                AppImages.user,
                const SizedBox(width: 20),
                Text(
                  serviceType,
                  style: AppTextStyles.style14w500
                      .copyWith(color: AppColors.onPrimary),
                ),
              ],
            ),
            Text(
              "Юридическое лицо/Банковские переводы",
              style: AppTextStyles.style14w500
                  .copyWith(color: AppColors.onPrimary),
            ),
          ],
        ),
      ],
    );
  }
}
