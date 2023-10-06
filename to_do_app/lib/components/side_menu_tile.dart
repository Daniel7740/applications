import 'package:flutter/material.dart';

import 'package:to_do_app/models/side_menu.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.isActive,
  }) : super(key: key);

  final SideMenuElement menu;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Stack(
      children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            height: 50,
            width: isActive ? MediaQuery.of(context).size.width / 1.4 - 40 : 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: color.onPrimary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            )),
        ListTile(
          onTap: press,
          contentPadding: const EdgeInsets.only(left: 0),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 34,
              height: 34,
              child: isActive ? Image.asset(menu.src_2) : Image.asset(menu.src),
            ),
          ),
          title: Text(
            menu.title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
