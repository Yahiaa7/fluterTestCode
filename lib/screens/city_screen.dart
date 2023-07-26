import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Model/weatherModel.dart';
import 'package:weather_app/services/networking.dart';

import '../utilities/constants.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  final Weather_Model weathermodel;

  const CityScreen({super.key, required this.weathermodel});

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  late NetworkHelper networkHelper;
  late Weather_Model cityWeatherModel;
  bool selectedWeather = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(
                          context, [selectedWeather, cityWeatherModel]);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              myCountryPicker(context);
            },
            child: const Text('Show country picker'),
          ),
        ]),
      ),
    ));
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
        networkHelper = NetworkHelper(
            url:
                "https://api.openweathermap.org/data/2.5/weather?q=${country.name}&appid=${kApiKey}&units=metric");
        cityWeatherModel = await networkHelper.getData();
        setState(() {
          selectedWeather = true;
        });
        if (context.mounted) Navigator.pop(context, [selectedWeather, cityWeatherModel]);
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
