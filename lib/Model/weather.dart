import 'package:weather_app/Model/weatherModel.dart';
import 'package:weather_app/services/location.dart';

import '../utilities/constants.dart';
import '../services/networking.dart';
import 'fetch_locatio_data.dart';

class WeatherModel {
  FetchLocationData? fetchLocationData;
  Weather_Model? weather_model;

  Future<Weather_Model?> getModelData() async {
    weather_model = await fetchLocationData?.getCurrentLocation();
    return weather_model;
  }

  // WeatherModel(
  //     {required this.temp, required this.weatherId, required this.name});
  //
  // WeatherModel toJson(Map<String, dynamic> json) => WeatherModel(
  //       temp: json['main']['temp'],
  //       weatherId: json['weather'][0]['id'],
  //       name: json['name'],
  //     );
  String getMessage() {
    if (weather_model!.main.temp > 25) {
      return 'It\'s 🍦 time';
    } else if (weather_model!.main.temp > 20) {
      return 'Time for shorts and 👕';
    } else if (weather_model!.main.temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getWeatherIcon() {
    if (weather_model!.weather[0].id < 300) {
      return '🌩';
    } else if (weather_model!.weather[0].id < 400) {
      return '🌧';
    } else if (weather_model!.weather[0].id < 600) {
      return '☔️';
    } else if (weather_model!.weather[0].id < 700) {
      return '☃️';
    } else if (weather_model!.weather[0].id < 800) {
      return '🌫';
    } else if (weather_model?.weather[0].id == 800) {
      return '☀️';
    } else if (weather_model!.weather[0].id <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
