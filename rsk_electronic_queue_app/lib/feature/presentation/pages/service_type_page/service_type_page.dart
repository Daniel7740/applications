import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/button_main.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

@RoutePage()
class ServiceTypePage extends StatefulWidget {
  const ServiceTypePage({super.key});

  @override
  State<ServiceTypePage> createState() => _ServiceTypePageState();
}

class _ServiceTypePageState extends State<ServiceTypePage> {
  @override
  Widget build(BuildContext context) {
    final serviceType = L10n.of(context).serviceType;
    final continueWord = L10n.of(context).continueWord;
    final serviceIndividuals = L10n.of(context).serviceIndividuals;

    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        // surfaceTintColor: AppColors.shadow,
        title: Text(
          serviceType,
          style: AppTextStyles.style16w600.copyWith(color: AppColors.onPrimary),
        ),
        leading: IconButton(
          icon: AppImages.arrowLeftBlack,
          onPressed: () => context.router.push(const FiliationRoute()),
        ),
      ),
      body: BackgroundImage(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  buttonColor: color.secondary,
                  buttonText: serviceIndividuals,
                  fontColor: color.background,
                  stateButtonColor: color.onErrorContainer,
                  onButtonTap: () => false,
                  borderRadius: 10,
                  borderColor: color.primary,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 300,
                  width: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AppAssetImages.group,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                ButtonWidget(
                  buttonColor: color.surfaceTint,
                  buttonText: continueWord,
                  fontColor: color.background,
                  stateButtonColor: color.onErrorContainer,
                  onButtonTap: () {
                    context.router.push(const QueueTimeRoute());
                  },
                  borderRadius: 10,
                  borderColor: color.primary,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// !
//  We want this side menu only for large screen
class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // DrawerHeader(
          //   child: Image.asset("images/logo.png"),
          // ),
          DrawerListTile(
            titel: "Dashboard",
            // svgSrc: "images/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Transaction",
            // svgSrc: "images/icons/menu_tran.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Task",
            // svgSrc: "images/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Documents",
            // svgSrc: "images/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Store",
            // svgSrc: "images/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Notification",
            // svgSrc: "images/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Profile",
            // svgSrc: "images/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            titel: "Settings",
            // svgSrc: "images/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, required this.titel, required this.press});

  final String titel;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        titel,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
