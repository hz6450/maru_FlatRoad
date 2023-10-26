import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'map_page_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MapPageWidget(),
    );
  }
}

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({Key? key}) : super(key: key);

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;
  late StreamSubscription _accelerometerSubscription;
  double _vibrationStrength = 0.0;

  @override
  void initState() {
    super.initState();
    _model = MapPageModel();
    _accelerometerSubscription = accelerometerEvents.listen((event) async {
      final double strength = sqrt(
        event.x * event.x +
            event.y * event.y +
            event.z * event.z,
      );

      setState(() {
        _vibrationStrength = strength;
      });

      if (_vibrationStrength >= 11) {
        Position position = await _determinePosition();
        _saveDataToFirestore(position, _vibrationStrength); // 메서드 이름을 변경했습니다.
      }
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vibration Detector'),
      ),
      body: Center(
        child: Text(
          'Vibration strength: ${_vibrationStrength.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
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
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _saveDataToFirestore(Position position, double strength) { // 메서드 이름을 변경했습니다.
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('vibrations').add({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'strength': strength,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
