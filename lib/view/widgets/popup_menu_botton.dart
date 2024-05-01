import 'package:coffee_shop/view/screens/help_screen.dart';
import 'package:coffee_shop/view/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'custom_menu_item.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    return PopupMenuButton(
      iconColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return [
          CustomMenuItem(
            leading: const Icon(Icons.person),
            title: appLocalization.popup_button_item1,
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
            title: appLocalization.popup_button_item2,
            onTaping: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
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
            title: appLocalization.popup_button_item3,
            onTaping: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HelpScreen(
                  appLocalizations: appLocalization,
                ),
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
            title: appLocalization.popup_button_item4,
            onTaping: () {},
          ),
        ];
      },
    );
  }
}
