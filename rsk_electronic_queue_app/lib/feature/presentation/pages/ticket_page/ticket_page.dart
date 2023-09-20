import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

@RoutePage()
class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    final textbigCheck = L10n.of(context).whenEnteringBank;
    final ticketCreated = L10n.of(context).yourTicketCreated;
    final ponyatno = L10n.of(context).ponyatno;
    final color = Theme.of(context).colorScheme;
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              AppImages.bigCheck,
              Text(ticketCreated,
                  style: AppTextStyles.style20w400
                      .copyWith(height: 3, color: AppColors.onPrimary)),
              Text(
                textbigCheck,
                maxLines: 4,
                style: AppTextStyles.style16w400
                    .copyWith(height: 2, color: AppColors.onPrimary),
              ),
              const Spacer(),
              ButtonWidget(
                buttonColor: color.surfaceTint,
                buttonText: ponyatno,
                fontColor: color.background,
                stateButtonColor: color.onErrorContainer,
                onButtonTap: () {
                  context.router.push(const YourTicketRoute());
                },
                borderRadius: 10,
                borderColor: color.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
