import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationDataProvider with ChangeNotifier {
  bool _isLocEnabled = false;

  bool get isLocEnabled => _isLocEnabled;

  Future<void> loadLocationEnabledState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _isLocEnabled = prefs.getBool('isLocEnabled') ?? false;
    notifyListeners();
  }

  Future<void> saveLocationEnabledState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLocEnabled = value;
    await prefs.setBool('isLocEnabled', value);
    notifyListeners();
  }

  Future<void> requestLocationPermission() async {
    final permissionStatus = await Permission.locationWhenInUse.status;
    if (permissionStatus.isGranted) {
      // Permission already granted, proceed with location access
      _getCurrentLocation();
      saveLocationEnabledState(true);
    } else {
      final locationStatus = await Permission.locationWhenInUse.request();
      if (locationStatus.isGranted) {
        _getCurrentLocation();
        saveLocationEnabledState(true);
      } else {
        saveLocationEnabledState(false);
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (error) {
      print('Error getting location: $error');
    }
  }
}
