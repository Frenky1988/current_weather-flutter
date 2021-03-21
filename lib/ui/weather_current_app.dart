import 'package:current_weather_app/model/model_forecast.dart';
import 'package:current_weather_app/network/network.dart';
import 'package:flutter/material.dart';
import 'mid_view.dart';

class WeatherAppCurrent extends StatefulWidget {
  @override
  _WeatherAppCurrentState createState() => _WeatherAppCurrentState();
}
class _WeatherAppCurrentState extends State<WeatherAppCurrent> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Berlin";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
    forecastObject.then((weather) => {
      print(weather.name),
      print(weather.weather[0].main)
    }); //test
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3949ab),
      body:
      ListView(
        children: [
          textViewField(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){

                  if(snapshot.hasData){
                    return Column(
                      children: [
                        MidView(snapshot: snapshot),
                      ],

                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),

    );
  }
  textViewField() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            //fillColor: Colors.blue, filled: true,
              hintText: "Enter City Name",hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search, color: Colors.white,),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0), borderSide: BorderSide(color: Colors.white)),
              contentPadding: EdgeInsets.all(16.0)
          ),
          onSubmitted: (value){
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }
  Future<WeatherForecastModel> getWeather({String cityName}) => new Network().getForecast(cityName: _cityName);
}
