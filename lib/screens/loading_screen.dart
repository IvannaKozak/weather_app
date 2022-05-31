import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const ApiKey = '200c1bb212ae79134196c5b19f403ef4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.location,
    ].request();
    Location myLocation = Location();
    await myLocation.getCurrentPosition();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;
    
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$ApiKey&units=metric');

    var weatherData = await networkHelper.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
