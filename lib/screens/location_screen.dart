import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Model/weather.dart';
import 'package:weather_app/Model/weatherModel.dart';

import '../services/networking.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  late Weather_Model weatherModel;

  LocationScreen({super.key, required this.weatherModel});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  // late Weather_Model cityLocation;
  //  final bool selectedCity;
  // late Weather_Model selectedWeather = widget.weatherModel;
  // void getWeather() {
  //   if (widget.selectedCity == true) {
  //     selectedWeather = widget.weatherCityModel;
  //   } else {
  //     selectedWeather = widget.weatherModel;
  //   }
  // }

  @override
  void initState() {
    // fetchweather_info();

    super.initState();
  }

  // Navogation(BuildContext context) async {
  //   List isSelectdWeather = await
  //   if (isSelectdWeather[1] == false) {
  //     selsectedWeather = widget.weatherModel;
  //   } else {
  //     selsectedWeather = cityLocation;
  //   }
  // }

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
                      onPressed: () async {
                        // Old Code
                        // final result = await Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CityScreen(
                        //             weathermodel: widget.weatherModel)));
                        // // widget.weatherModel = result[1];
                        // print(result);
                        // setState(() {
                        //   widget.weatherModel = result[1];
                        //   print(widget.weatherModel.name);
                        // });

                        //  New Code
                        myCountryPicker(context);
                      },
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
                    Text(WeatherModel()
                        .getWeatherIcon(id: widget.weatherModel.weather[0].id)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${widget.weatherModel.main.temp}",
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
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  WeatherModel()
                      .getMessage(temp: widget.weatherModel.main.temp),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ],
      ),
    );
  }

  void myCountryPicker(BuildContext context) {
    return showCountryPicker(
      context: context,
      //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
      exclude: <String>['KN', 'MF'],
      favorite: <String>['SE'],
      //Optional. Shows phone code before the country name.
      showPhoneCode: true,
      onSelect: (Country country) async {
        print('Select country: ${country.displayName}');
        //TODO:
        NetworkHelper networkHelper = NetworkHelper(
            url:
                "https://api.openweathermap.org/data/2.5/weather?q=${country.name}&appid=${kApiKey}&units=metric");

        () async {
          widget.weatherModel = await networkHelper.getData();
          setState(() {});
        }();
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }
}
