import 'package:weather_app/Model/weatherModel.dart';

import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class FetchLocationData {
  Future<Weather_Model> getCurrentLocation() async {
    Location location = Location();
    await location
        .getCurrentLocation(); //return location (lat,long) and permission to use location

    NetworkHelper networkHelper = NetworkHelper(
        /*seng api url to be connect and send new location info */
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$kApiKey&units=metric");
    Weather_Model weatherInfo = await networkHelper
        .getData(); /*connect to api and convert string into weather model and the returned type is Weather_Model */

    return weatherInfo;
  }
}
