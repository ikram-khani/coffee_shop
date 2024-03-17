import '../../view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      color: const Color.fromRGBO(255, 245, 233, 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            height: 40,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                CustomListTile(
                  leading: const Icon(Icons.person),
                  title: 'Profile',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(height: 1.0, color: Colors.grey),
              ],
            ),
          ),
          PopupMenuItem(
            height: 40,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                CustomListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: 'Settings',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(height: 1.0, color: Colors.grey),
              ],
            ),
          ),
          PopupMenuItem(
            height: 40,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                CustomListTile(
                  leading: const Icon(Icons.help_outline),
                  title: 'Help',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(height: 1.0, color: Colors.grey),
              ],
            ),
          ),
          PopupMenuItem(
            height: 40,
            padding: EdgeInsets.zero,
            child: CustomListTile(
              leading: const Icon(Icons.logout_outlined),
              title: 'Logout',
              onTap: () {},
            ),
          ),
        ];
      },
    );
  }
}
