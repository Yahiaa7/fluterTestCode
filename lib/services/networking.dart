import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather.dart';
import 'package:weather_app/Model/weatherModel.dart';

import '../utilities/constants.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future<Weather_Model> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Weather_Model JsonDecode = weatherModelFromJson(
          response.body); /*convert string body (response) to WeatherModel*/
      // print(response.body);
      return JsonDecode; /*return and the return type is json*/
    }
    return Future.error("somthing wrong");
  }
}
