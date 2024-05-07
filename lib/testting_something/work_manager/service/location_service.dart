import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // Future<void> checkLocationPermission() async {
  //   PermissionStatus status = await Permission.locationWhenInUse.status;
  //   log('Status: $status');
  //   if (status.isDenied) {
  //     // Izin belum diberikan, minta izin dari pengguna
  //     status = await Permission.locationWhenInUse.request();
  //     if (status.isDenied) {
  //       // Izin ditolak oleh pengguna, berikan pesan kepada pengguna
  //       print('Izin lokasi ditolak oleh pengguna');
  //     }
  //   }
  // }
  static requestPermission() async {
    if (!kIsWeb && Platform.isWindows) return;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }
}
