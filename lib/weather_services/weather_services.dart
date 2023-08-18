import '../weather_model/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherServices{

  String baseAPI = "http://api.weatherapi.com/v1/";
  String apiKey = "2d2e8c33c1b24281abd232842231408";
  WeatherModel? weatherModel;

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        "${baseAPI}forecast.json?key=${apiKey}&q=${cityName}&days=1&aqi=no&alerts=no");
    var response = await http.get(url);
    if(response.statusCode == 400) {
    var data = jsonDecode(response.body);
    throw Exception(data['error']['message']);}
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}