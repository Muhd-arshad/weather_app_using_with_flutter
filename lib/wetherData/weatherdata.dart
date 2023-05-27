import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_flutter/modelforApi/weathermodel.dart';

class WeatherData {
  Future<Weather> getdata(var latitude, var longtitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=b4482f37ba6044be93980800232205&q=$latitude,$longtitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
