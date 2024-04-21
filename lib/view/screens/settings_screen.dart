import 'package:coffee_shop/view/widgets/setting_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLocEnabled = false;

  Position? _currentLocation;

  Future<void> _requestLocationPermission() async {
    final locationStatus = await Permission.locationWhenInUse.request();
    if (locationStatus.isGranted) {
      setState(
        () => _isLocEnabled = true,
      );
      _getCurrentLocation();
    } else {
      // Handle permission denial or limited access (e.g., show a snackbar)
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() => _currentLocation = position);
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (error) {
      print('Error getting location: $error');
    }
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
                  onChanged: (value) async {
                    if (value) {
                      await _requestLocationPermission();
                    } else {
                      setState(
                        () => _isLocEnabled = false,
                      );
                      _currentLocation = null; // Clear location data
                    }
                  },
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.grey.withOpacity(0.4),
                  activeTrackColor: Colors.blue,
                  thumbColor: MaterialStateColor.resolveWith(
                    (states) => Colors.white,
                  ),
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
