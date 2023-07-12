import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/weather.dart';
import '../services/location.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  void getWeatherData() async {
    WeatherModel weatherInfo = WeatherModel();
    await weatherInfo.getCurrentLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherInfo,
      );
    }));
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
