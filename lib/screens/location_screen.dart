import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/Model/weatherModel.dart';

import '../Model/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weather_info});
  final WeatherModel weather_info;
  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  int? temp;
  String? name;
  int? weatherId;
  String? message;
  String? icon;
  fetchweather_info() async {
    Weather_Model? weather_model = await widget.weather_info.getModelData();
    temp = weather_model?.main.temp.toInt();
    name = weather_model?.name;
    weatherId = weather_model?.weather[0].id;
    //   icon=weather_model.
  }

  @override
  void initState() {
    fetchweather_info();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('images/location_background.jpg'),
                image: const NetworkImage(
                    'https://source.unsplash.com/random/?nature,day'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  // color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: kSecondaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("icon!,"),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$temp",
                          style: kTempTextStyle,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 7,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.circle,
                                  ),
                            ),
                            const Text(
                              'now',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Spartan MB',
                                letterSpacing: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  message!,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: EdgeInsets.all(34),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
