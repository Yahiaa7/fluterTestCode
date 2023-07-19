import 'package:weather_app/Model/weatherModel.dart';

import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class FetchLocationData {
  Future<Weather_Model> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$kApiKey&units=metric");
    Weather_Model weatherInfo = await networkHelper.getData();
    return weatherInfo;
  }
}
