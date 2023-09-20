part of '../service_items_page.dart';

//? MapButtons
class Navigation extends StatelessWidget {
  const Navigation(
      {super.key, required this.icon, required this.onNavigatorMaps});
  final String icon;
  final VoidCallback onNavigatorMaps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: AppImages.minus,
            onPressed: () {
              print('minus');
            },
          ),
          IconButton(
            icon: AppImages.plus,
            onPressed: () {
              print('plus');
            },
          ),
          IconButton(
            icon: AppImages.pointer,
            onPressed: () {
              print('pointer');
            },
          ),
        ],
      ),
    );
  }
}
