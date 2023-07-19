import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/networking.dart';
import '../Model/weatherModel.dart';
import '../services/location.dart';
import '../Model/weather.dart';
import '../utilities/constants.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  getWeatherData() async {
    WeatherModel weatherModel = WeatherModel();
    // await weatherModel.getCurrentLocation();

    if (mounted) {
      /*if we in the widget execute the widget and we use it before set State */
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LocationScreen(weather_info: weatherModel)));
    }
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
