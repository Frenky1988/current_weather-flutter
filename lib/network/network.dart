import 'dart:convert';
import 'package:current_weather_app/model/model_forecast.dart';
import 'package:current_weather_app/util/util.dart';
import 'package:http/http.dart';

class Network {

  Future<WeatherForecastModel> getForecast({String cityName}) async{

    var finalUrl = "http://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid="+Util.apiId+"&units=metric";

    final response = await get(Uri.encodeFull(finalUrl));

    if (response.statusCode != 200){
      throw Exception("Server error");
    }else{
      return WeatherForecastModel.fromJson(jsonDecode(response.body));
    }
  }
}