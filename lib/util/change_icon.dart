
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getIcons({weatherDescription, Color color, double size}) {
  switch (weatherDescription) {
    case "Rain":
      {
        return Icon(
            FontAwesomeIcons.cloudRain, color: Colors.white, size: 210);
      }
      break;
    case "Clear":
      {
        return Icon(Icons.wb_sunny, color: Colors.yellowAccent, size: size);
      }
      break;
    case "Clouds":
      {
        return Icon(
            FontAwesomeIcons.cloud, color: Colors.white, size: size);
      }
      break;
    case "light rain":
      {
        return Icon(FontAwesomeIcons.cloudRain, color: Colors.white,
            size: size);
      }
      break;
    case "scattered clouds":
      {
        return Icon(
            FontAwesomeIcons.cloud, color: Colors.white, size: size);
      }
      break;
    case "broken clouds":
      {
        return Icon(
            FontAwesomeIcons.cloud, color: Colors.white, size: size);
      }
      break;
    case "Snow":
      {
        return Icon(
            FontAwesomeIcons.snowflake, color: Colors.white, size: size);
      }
      break;
    case "overcast clouds":
      {
        return Icon(
            FontAwesomeIcons.cloud, color: Colors.white, size: size);
      }
      break;
    case "few clouds":
      {
        return Icon(
            FontAwesomeIcons.cloud, color: Colors.white, size: size);
      }
      break;
    default:
      {
        return Icon(
            Icons.wb_sunny, color: Colors.yellowAccent, size: size);
      }
      break;
  }
}