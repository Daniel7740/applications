import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/feature/presentation/widgets/background_image.dart';
// import 'package:rsk_electronic_queue/feature/presentation/pages/service_items_page/widgets/panel_maps.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'widgets/maps.dart';

part 'widgets/navigation_maps.dart';
part 'widgets/panel_maps.dart';
part 'widgets/list_openclose_bank.dart';

@RoutePage()
class ServiceItemsPage extends StatefulWidget {
  const ServiceItemsPage({super.key});

  @override
  State<ServiceItemsPage> createState() => _ServiceItemsPageState();
}

class _ServiceItemsPageState extends State<ServiceItemsPage> {
  // panel
  static const double fabHeightClosed = 116.0;
  double fabHeight = fabHeightClosed;
  final panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    final maps = L10n.of(context).maps;
    final listscroll = L10n.of(context).listscroll;
    final serviceItims = L10n.of(context).serviceItims;
    final streetM = L10n.of(context).streetM;
    final streetT = L10n.of(context).streetT;
    final centralBranch = L10n.of(context).centralBranch;
    final headOffice = L10n.of(context).headOffice;
    final closed = L10n.of(context).closed;
    final openUntil = L10n.of(context).openUntil;
    final panelHefhtOpen = MediaQuery.of(context).size.height * 0.4;
    final panelHefhtClosed = MediaQuery.of(context).size.height * 0.1;
    return BackgroundImage(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.surfaceTint,
              surfaceTintColor: AppColors.shadow,
              title: Text(
                serviceItims,
                style: AppTextStyles.style16w600
                    .copyWith(color: AppColors.background),
              ),
              leading: IconButton(
                icon: AppImages.arrowLeft,
                onPressed: () => context.router.push(
                  const UnauthorizedRoute(),
                ),
              ),
              actions: [
                IconButton(
                  icon: AppImages.filter,
                  onPressed: () => false,
                ),
              ],
              bottom: TabBar(
                isScrollable: false,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                indicatorWeight: 3,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                labelStyle: AppTextStyles.style14w400,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: maps),
                  Tab(text: listscroll),
                ],
              ),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //* Карта
// !Временная карта
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SlidingUpPanel(
                        //Нижняя панель, рядом со мной
                        color: AppColors.secondaryContainer,
                        controller: panelController,
                        maxHeight: panelHefhtOpen,
                        minHeight: panelHefhtClosed,
                        parallaxEnabled: true,
                        parallaxOffset: .7,
                        body: const MyWidgetGoogleMap(),
                        panelBuilder: (controller) => PanelWidget(
                          controller: controller,
                          panelController: panelController,
                        ),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30)),
                        onPanelSlide: (position) => setState(() {}),
                      ),
                    ],
                  ),

//* Список
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AppAssetImages.landscape,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, position) {
                        return Card(
                          color: AppColors.background,
                          child: ListOpenCloseBank(
                            street: streetM,
                            typefiliation: centralBranch,
                            state: closed,
                            km: 30,
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return Card(
                          color: AppColors.background,
                          child: ListOpenCloseBank(
                            street: streetT,
                            typefiliation: headOffice,
                            state: openUntil,
                            km: 10,
                          ),
                        );
                      },
                      itemCount: 53,
                    ),
                  )
                ]),
          )),
    );
  }
}
