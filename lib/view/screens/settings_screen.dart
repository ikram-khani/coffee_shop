import 'package:coffee_shop/view/widgets/setting_item_tile.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLocEnabled = false;
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
          toolbarHeight: 70,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
                trailingText: 'Light Mode',
              ),
              SettingItemTile(
                leadingIcon: Icons.translate,
                title: 'Language',
                trailingText: 'English',
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0),
                leading: const Icon(Icons.location_on_outlined),
                title: const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                trailing: Switch(
                  value: _isLocEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isLocEnabled = !_isLocEnabled;
                    });
                  },
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  thumbColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  activeTrackColor: Colors.blue,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Account & Security',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SettingItemTile(
                leadingIcon: Icons.person_4_outlined,
                title: 'Account Information',
              ),
              SettingItemTile(
                leadingIcon: Icons.verified_user_outlined,
                title: 'Security & Authentications',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Other',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SettingItemTile(
                leadingIcon: Icons.lock_outline,
                title: 'Privacy Policy',
              ),
              SettingItemTile(
                leadingIcon: Icons.description_outlined,
                title: 'Terms & Conditions',
              ),
              SettingItemTile(
                leadingIcon: Icons.people_outline_outlined,
                title: 'About us',
              ),
              const ListTile(
                contentPadding: EdgeInsets.only(left: 0),
                title: Text(
                  'App Version',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                trailing: Text('1.0.0'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
