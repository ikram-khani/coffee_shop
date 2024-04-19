import 'package:coffee_shop/view/widgets/setting_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = 70.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          centerTitle: true,
          title: const Text('Settings'),
          toolbarHeight: 100,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SettingItemTile(
              leadingIcon: Icons.light_mode_outlined,
              title: 'Theme',
              trailingText: 'Light mode',
            ),
            SettingItemTile(
              leadingIcon: Icons.translate,
              title: 'Language',
              trailingText: 'English',
            ),
            SettingItemTile(
              leadingIcon: Icons.person_4_outlined,
              title: 'Account information',
            ),
            SettingItemTile(
              leadingIcon: Icons.verified_user_outlined,
              title: 'Security and authentication',
            ),
            SettingItemTile(
              leadingIcon: Icons.lock_outline,
              title: 'Privacy policy',
            ),
            SettingItemTile(
              leadingIcon: Icons.description_outlined,
              title: 'Terms and conditions',
            ),
            SettingItemTile(
              leadingIcon: Icons.people_outline,
              title: 'About us',
            ),
          ],
        ),
      ),
    );
  }
}
