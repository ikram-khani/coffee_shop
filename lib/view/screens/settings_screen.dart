import 'package:coffee_shop/view/widgets/setting_item_tile.dart';
import 'package:coffee_shop/view_models/location_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationDataProvider>(context, listen: false)
        .loadLocationEnabledState();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 70.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
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
              const SettingItemTile(
                leadingIcon: Icons.light_mode_outlined,
                title: 'Theme',
                trailingText: 'Light Mode',
              ),
              const SettingItemTile(
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
                trailing: Consumer<LocationDataProvider>(
                  builder: (context, provider, child) {
                    bool isLocationEnabled = provider.isLocEnabled;
                    return Switch(
                      value: isLocationEnabled,
                      onChanged: (value) async {
                        if (value) {
                          await provider.requestLocationPermission();
                        } else {
                          await provider.saveLocationEnabledState(false);
                        }
                      },
                      activeColor: Colors.blue,
                      inactiveTrackColor: Colors.grey.withOpacity(0.4),
                      activeTrackColor: Colors.blue,
                      thumbColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                    );
                  },
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
              const SettingItemTile(
                leadingIcon: Icons.person_4_outlined,
                title: 'Account Information',
              ),
              const SettingItemTile(
                leadingIcon: Icons.verified_user_outlined,
                title: 'Security & Authentications',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Other',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SettingItemTile(
                leadingIcon: Icons.lock_outline,
                title: 'Privacy Policy',
              ),
              const SettingItemTile(
                leadingIcon: Icons.description_outlined,
                title: 'Terms & Conditions',
              ),
              const SettingItemTile(
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
