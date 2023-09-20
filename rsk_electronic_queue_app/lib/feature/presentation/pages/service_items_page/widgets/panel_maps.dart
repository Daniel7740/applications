part of '../service_items_page.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget(
      {super.key, required this.controller, required this.panelController});
  final ScrollController controller;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    final streetM = L10n.of(context).streetM;
    final streetT = L10n.of(context).streetT;
    final centralBranch = L10n.of(context).centralBranch;
    final headOffice = L10n.of(context).headOffice;
    final closed = L10n.of(context).closed;
    final openUntil = L10n.of(context).openUntil;
    final nextTome = L10n.of(context).nextTome;

    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            const SizedBox(height: 8),
            buildDragonHable(),
            const SizedBox(height: 8),
            Row(
              children: [
                AppImages.bank,
                const SizedBox(width: 10),
                Text(
                  nextTome,
                  style: AppTextStyles.style16w600,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              // color: AppColors.secondaryContainer,
              child: ListOpenCloseBank(
                street: streetM,
                typefiliation: centralBranch,
                state: closed,
                km: 30,
              ),
            ),
            const Divider(
                color: AppColors.outlineVariant,
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 2),
            SizedBox(
              // color: AppColors.secondaryContainer,
              child: ListOpenCloseBank(
                street: streetT,
                typefiliation: headOffice,
                state: openUntil,
                km: 10,
              ),
            ),
            const Divider(
                color: AppColors.outlineVariant,
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 2),
          ]),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  buildDragonHable() => GestureDetector(
        onTap: togglenPanel,
        child: Center(
          child: Container(
            height: 4,
            width: 200,
            decoration: BoxDecoration(
              color: AppColors.inversePrimary,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      );

  void togglenPanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  buildAboutText() {}
}
