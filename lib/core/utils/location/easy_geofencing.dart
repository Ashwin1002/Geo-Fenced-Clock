import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

///
/// Geofence events state
/// [init]: this is triggered when geofence service started
/// [enter]: this is triggered when the device current location is in the allocated geofence area
/// [exit]: this is triggered when the device current location is outside of the allocated geofence area
///
enum GeofenceStatus {
  init,
  enter,
  exit;

  bool get isInit => this == GeofenceStatus.init;
  bool get isEnter => this == GeofenceStatus.enter;
  bool get isExit => this == GeofenceStatus.exit;
}

extension GeofenceExt on GeofenceStatus {
  A when<A>({
    required A Function() enter,
    required A Function() exit,
    required A Function() initial,
  }) {
    return switch (this) {
      GeofenceStatus.enter => enter(),
      GeofenceStatus.init => initial(),
      _ => exit(),
    };
  }
}

////
///  Geofence Package [ROOT] class which have [three] important public
///  functions [startGeoFenceService(),stopGeoFenceService(),getGeoFenceStream()]
///
class EasyGeofencing {
  ///
  /// [ _positionStream ] is for getting stream position on location updates
  ///
  static StreamSubscription<Position>? _positionStream;

  ///
  /// [_geostream] is for geofence event stream
  ///
  static Stream<GeofenceStatus>? _geoFencestream;

  ///
  /// [_controller] is Stream controller for geofence event stream
  ///
  static final StreamController<GeofenceStatus> _controller =
      StreamController<GeofenceStatus>.broadcast();

  ///
  /// Parser method which is basically for parsing [String] values
  /// to [double] values
  ///
  static double _parser(String? value) {
    debugPrint('Parse value===>${value!.isEmpty}');
    double? doubledValue = 0.0;
    try {
      doubledValue = double.parse(value.isEmpty ? '0' : value);
    } catch (e) {
      debugPrint('VALUE IS ===> $value    ${value.isEmpty}');
      debugPrint('EXCEPTION DOUBLE===> $e');
    }
    return doubledValue!;
  }

  ///
  /// For [getting geofence event stream] property which is basically returns [_geostream]
  ///
  static Stream<GeofenceStatus>? getGeofenceStream() {
    return _geoFencestream;
  }

  ///
  /// [startGeofenceService] To start the geofence service
  /// this method takes this required following parameters
  /// pointedLatitude is the latitude of geofencing area center which is [String] datatype
  /// pointedLongitude is the longitude of geofencing area center which is [String] datatype
  /// radiusMeter is the radius of geofencing area in meters
  /// radiusMeter takes value is in [String] datatype and
  /// eventPeriodInSeconds will determine whether the stream listener period in seconds
  /// eventPeriodInSeconds takes value in [int]
  /// The purpose of this method is to initialize and start the geofencing service.
  /// At first it will check location permission and if enabled then it will start listening the current location changes
  /// then calculate the distance of changes point to the allocated geofencing area points
  ///
  static void startGeofenceService({
    required String? pointedLatitude,
    required String? pointedLongitude,
    required String? radiusMeter,
    int? eventPeriodInSeconds,
  }) {
    //parsing the values to double if in any case they are coming in int etc
    double latitude = _parser(pointedLatitude);
    double longitude = _parser(pointedLongitude);
    double radiusInMeter = _parser(radiusMeter);
    //starting the geofence service only if the positionstream is null with us
    if (_positionStream == null) {
      _geoFencestream = _controller.stream;
      _positionStream =
          Geolocator.getPositionStream().listen((Position position) {
        double distanceInMeters = Geolocator.distanceBetween(
            latitude, longitude, position.latitude, position.longitude);
        _printOnConsole(
            latitude, longitude, position, distanceInMeters, radiusInMeter);
        _checkGeofence(distanceInMeters, radiusInMeter);
        if (_positionStream != null && eventPeriodInSeconds != null) {
          _positionStream!
              .pause(Future.delayed(Duration(seconds: eventPeriodInSeconds)));
        }
      });
      _controller.add(GeofenceStatus.init);
    }
  }

  ///
  /// [_checkGeofence] is for checking whether current location is in
  /// or
  /// outside of the geofence area
  /// this takes two parameters which is [double] distanceInMeters
  /// distanceInMeters parameters is basically the calculated distance between
  /// geofence area points and the current location points
  /// radiusInMeter take value in [double] and it's the radius of geofence area in meters
  ///
  static void _checkGeofence(double distanceInMeters, double radiusInMeter) {
    if (distanceInMeters <= radiusInMeter) {
      _controller.sink.add(GeofenceStatus.enter);
    } else {
      _controller.sink.add(GeofenceStatus.exit);
    }
  }

  ///
  /// [stopGeofenceService] to stop the geofencing service
  /// if the [_positionStream] is not null then
  /// it will cancel the subscription of the stream
  ///
  static void stopGeofenceService() {
    if (_positionStream != null) {
      unawaited(_positionStream!.cancel());
      _positionStream = null;
    }
  }

  ///
  /// [distanceBetween] to find distance between two
  /// geofence points outside the class to with full
  /// of precisions
  ///
  static double distanceBetween(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos as double Function(num?);
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  ///
  /// [_printOnConsole] to help end user for debugging the existing code
  ///
  static void _printOnConsole(
      latitude, longitude, Position position, distanceInMeters, radiusInMeter) {
    debugPrint('Started Position $latitude  $longitude');
    debugPrint('Current Position ${position.toJson()}');
    debugPrint(
        'Distance in meters $distanceInMeters and Radius in Meter $radiusInMeter');
  }
}
