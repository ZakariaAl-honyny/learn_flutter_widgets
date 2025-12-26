import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
// import 'package:geolocator_android/geolocator_web.dart';
import 'package:geolocator_apple/geolocator_apple.dart';

class GeolocatorPackage extends StatefulWidget {
  const GeolocatorPackage({super.key});

  @override
  State<GeolocatorPackage> createState() => _GeolocatorPackageState();
}

class _GeolocatorPackageState extends State<GeolocatorPackage> {
  StreamSubscription<Position>? _positionStream;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Geolocator.openLocationSettings();
      // You can also return a Future.error here to indicate
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    if (permission == LocationPermission.whileInUse) {
      _positionStream = Geolocator.getPositionStream().listen((
        Position? position,
      ) {
        print('=======================');
        print(
          position == null
              ? 'Unknown'
              : '${position.latitude.toString()}, ${position.longitude.toString()}',
        );
        print('=======================');
      });
    }


    // Calculate the distance between two points.
    // Example coordinates: Berlin and Amsterdam
    double distanceInMeters = Geolocator.distanceBetween(
      52.2165157,
      6.9437819,
      52.3546274,
      4.8285838,
    );
    print('Distance in meters: ${distanceInMeters / 1000} km');

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  /// Get the current position of the device and display it.
  /// This method is called when the widget is built.
  Future<void> _getCurrentPosition() async {
    try {
      Position position = await _determinePosition();
      print('Current position:  ${position.latitude}, ${position.longitude}');
    } catch (e) {
      print('Error getting position: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_positionStream != null) {
      // Check if the stream is not null before canceling
      _positionStream?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geolocator package')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
