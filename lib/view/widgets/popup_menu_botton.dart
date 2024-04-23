import 'package:coffee_shop/view/screens/help_screen.dart';
import 'package:coffee_shop/view/screens/settings_screen.dart';

import 'custom_menu_item.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      iconColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      color: const Color.fromRGBO(255, 245, 233, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return [
          CustomMenuItem(
            leading: const Icon(Icons.person),
            title: 'Profile',
            onTaping: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            divider: const Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Divider(height: 1.0, color: Colors.grey),
              ],
            ),
          ),
          CustomMenuItem(
            leading: const Icon(Icons.settings_outlined),
            title: 'Settings',
            onTaping: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
            divider: const Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Divider(height: 1.0, color: Colors.grey),
              ],
            ),
          ),
          CustomMenuItem(
            leading: const Icon(Icons.help_outline),
            title: 'Help',
            onTaping: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpScreen(),
              ));
            },
            divider: const Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Divider(height: 1.0, color: Colors.grey),
              ],
            ),
          ),
          CustomMenuItem(
            leading: const Icon(Icons.logout_outlined),
            title: 'Logout',
            onTaping: () {},
          ),
        ];
      },
    );
  }
}
