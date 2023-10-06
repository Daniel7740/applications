import 'package:flutter/material.dart';
import 'package:to_do_app/components/avatar.dart';

import 'package:to_do_app/components/side_menu_tile.dart';
import 'package:to_do_app/components/user_name.dart';
import 'package:to_do_app/models/side_menu.dart';

// Боковое меню
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  SideMenuElement selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width / 1.4, // 288
        height: double.infinity,
        color: color.primary,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Avatar(color: color),
                ),
                const Spacer(),
                const UserName(
                  firstName: 'Danil',
                  lastName: 'Zinin',
                ),
                const Spacer(),
                ...sideMenus.map(
                  (e) => SideMenuTile(
                    menu: e,
                    press: () {
                      setState(() {
                        selectedMenu = e;
                      });
                    },
                    isActive: selectedMenu == e,
                  ),
                ),
                const Spacer(
                  flex: 8,
                ),
                ...sideMenus2.map(
                  (e) => SideMenuTile(
                    menu: e,
                    press: () {
                      setState(() {
                        selectedMenu = e;
                      });
                    },
                    isActive: selectedMenu == e,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
