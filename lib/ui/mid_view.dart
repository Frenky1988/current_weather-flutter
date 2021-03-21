import 'package:current_weather_app/model/model_forecast.dart';
import 'package:current_weather_app/util/change_icon.dart';
import 'package:current_weather_app/util/util.dart';
import 'package:flutter/material.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forecast = snapshot.data;
    var city = forecast.name;
    var country = forecast.sys.country;
    var date = Util.getDate(new DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000));
    //var clock = Util.getClock(new DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000));
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$city, $country", style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
            Text("$date", style: TextStyle(color: Colors.white),),
            //Text("$clock"),
            SizedBox(height: 15.0),
            getIcons(weatherDescription: forecast.weather[0].description, size: 210,color: Colors.yellowAccent ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast.main.temp.toStringAsFixed(0)} °C", style: TextStyle(fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(forecast.weather[0].description.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Feels like: ${forecast.main.feelsLike.toStringAsFixed(0)} °C", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Temp max: ${forecast.main.tempMax.toStringAsFixed(0)} °C", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Wind: ${forecast.wind.speed.toStringAsFixed(1)} km/h",style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Temp min: ${forecast.main.tempMin.toStringAsFixed(0)} °C", style: TextStyle(fontSize: 15, color: Colors.white)),
                    )],
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Pressure: ${forecast.main.pressure.toStringAsFixed(0)} mb",style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Humidity: ${forecast.main.humidity.toStringAsFixed(0)} %", style: TextStyle(fontSize: 15, color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
