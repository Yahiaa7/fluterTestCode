import 'package:flutter/material.dart';
import 'package:weather_app/Model/fetch_locatio_data.dart';

import '../Model/weatherModel.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  getWeatherData() async {
    FetchLocationData fetchLocationData = FetchLocationData();

    Weather_Model weatherModel = await fetchLocationData.getCurrentLocation();

    if (mounted) {
      /*if we in the widget execute the widget and we use it before set State to interrupts what become after them  */
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LocationScreen(weatherModel: weatherModel)));
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
