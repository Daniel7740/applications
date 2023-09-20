//? Filiation Филиалы

import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

@RoutePage()
// class FiliationPage extends StatelessWidget {
//   const FiliationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Филиалы"),
//         leading: IconButton(
//           icon: Image.asset("assets/icons/arrow_left.png"),
//           onPressed: () => Navigator.pushNamed(context, '/ServiceItems'),
//         ),
//       ),
//       body: const FiliationPage(),
//     );
//   }
// }

class FiliationPage extends StatefulWidget {
  const FiliationPage({super.key});

  @override
  State<FiliationPage> createState() => _FiliationPageState();
}

class _FiliationPageState extends State<FiliationPage> {
  @override
  Widget build(BuildContext context) {
    final streetT = L10n.of(context).streetT;
    final centralBranch = L10n.of(context).centralBranch;
    final serviceIndividuals = L10n.of(context).serviceIndividuals;
    final lunchBreak = L10n.of(context).lunchBreak;
    final serviceLegal = L10n.of(context).serviceLegal;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        // surfaceTintColor: AppColors.shadow,
        title: Text(
          centralBranch,
          style: AppTextStyles.style16w600.copyWith(color: AppColors.onPrimary),
        ),
        leading: IconButton(
          icon: AppImages.arrowLeftBlack,
          onPressed: () => context.router.push(const ServiceItemsRoute()),
        ),
      ),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          // mainAxisAlignment: MainAxisAlignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.sp,
                children: [
                  AppImages.location,
                  const SizedBox(width: 10),
                  Text(
                    streetT,
                    style: AppTextStyles.style16w400
                        .copyWith(color: AppColors.onPrimary),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppImages.calendar,
                      const SizedBox(width: 10),
                      Text(
                        "Понедельние - Пятница",
                        style: AppTextStyles.style14w500
                            .copyWith(color: AppColors.onPrimary),
                      ),
                    ],
                  ),
                  Text(
                    "9:00 - 16:00",
                    style: AppTextStyles.style14w500
                        .copyWith(color: AppColors.onPrimary),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppImages.clock,
                      const SizedBox(width: 10),
                      Text(
                        lunchBreak,
                        style: AppTextStyles.style14w500
                            .copyWith(color: AppColors.onPrimary),
                      ),
                    ],
                  ),
                  Text(
                    "12:00 - 13:00",
                    style: AppTextStyles.style14w500
                        .copyWith(color: AppColors.onPrimary),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topCenter,
                // width: 200,
                child: SizedBox(
                  height: 300,
                  width: 500,
                  child: FittedBox(fit: BoxFit.fill, child: AppImages.miniMaps),
                ),
              ),
              const Spacer(),
              ButtonWidget(
                buttonColor: color.secondary,
                buttonText: serviceLegal,
                fontColor: color.background,
                stateButtonColor: color.primary.withOpacity(0.1),
                onButtonTap: () {
                  context.router.push(const ServiceTypeRoute());
                },
                borderColor: color.primary,
                borderRadius: 12,
                icons: AppImages.arrowLeftBlack,
              ),
              const SizedBox(height: 20),
              // AppImages.arrowLeftBlack,
              ButtonWidget(
                buttonColor: color.secondary,
                buttonText: serviceIndividuals,
                fontColor: color.background,
                stateButtonColor: color.primary.withOpacity(0.1),
                onButtonTap: () {
                  context.router.push(const ServiceTypeRoute());
                },
                borderColor: color.primary,
                borderRadius: 12,
                icons: AppImages.arrowLeftBlack,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
