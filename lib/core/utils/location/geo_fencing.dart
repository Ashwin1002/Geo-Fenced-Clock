import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geo_fenced_clock/core/core.dart';
import 'package:geo_fenced_clock/core/utils/location/easy_geofencing.dart';
import 'package:geolocator/geolocator.dart';

class GeoFencing {
  Future<LocationPermission> checkAndRequestLocationPermission(
      BuildContext context) async {
    LocationPermission permission;

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }

  // Future<void> openAppSettings() async {
  //   final uri = Uri.parse('app-settings:');
  //   final isOpened = await launchUrl(uri);

  //   if (!isOpened) {
  //     throw 'Could not open app settings';
  //   }
  // }

  Future<Position?> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<bool> get hasCurrentPosition async =>
      await getCurrentPosition() != null;

  void startGeoFencingService({
    required String? latitude,
    required String? longitude,
    String? radiusInMeter,
    int? eventPeriodInSeconds,
  }) {
    EasyGeofencing.startGeofenceService(
      pointedLatitude: latitude,
      pointedLongitude: longitude,
      radiusMeter: radiusInMeter ?? '50',
      eventPeriodInSeconds: eventPeriodInSeconds ?? 5,
    );
  }

  void stopGeoFencingService() {
    EasyGeofencing.stopGeofenceService();
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openAppSettings();
  }

  Future<void> checkPermission(BuildContext context) async {
    // Check for location permissions
    var permission = await Geolocator.checkPermission();

    /// if permission is denied then request permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    /// if permission is denied forever then show a alert box open app settings to enable location service
    else if (permission == LocationPermission.deniedForever) {
      if (!context.mounted) return;
      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog.adaptive(
            title: Text(
              'Permission required'.hardcoded,
            ),
            content: Text(
              'Please enable location permissions in your device settings to use this feature.'
                  .hardcoded,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(dialogContext).pop(false);
                },
              ),
              TextButton(
                child: const Text('Settings'),
                onPressed: () async {
                  Navigator.of(dialogContext).pop(true); // Close dialog
                  await openLocationSettings(); // Open app settings
                },
              ),
            ],
          );
        },
      );
    }
  }
}
