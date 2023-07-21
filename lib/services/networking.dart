import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weatherModel.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future<Weather_Model> getData() async {
    http.Response response = await http.get(Uri.parse(url)); //connect to api
    if (response.statusCode == 200) {
      /*check the response*/
      Weather_Model JsonDecode = weatherModelFromJson(
          response.body); /*convert string body (response) to WeatherModel*/

      return JsonDecode; /*return and the return type is json*/
    }

    return Future.error("somthing wrong");
  }
}
