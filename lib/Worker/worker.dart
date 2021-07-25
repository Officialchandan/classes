import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  late String location;
  Worker({required this.location}) {
    location = this.location;
  }
  late String temp;
  late String humidity;
  // ignore: non_constant_identifier_names
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  //*Mothod for Worker
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=e34a5eb0b4c5ff748fdf9219a63d224e"));

      Map data = jsonDecode(response.body);
      //Getting Temp,Humidiy
      // ignore: non_constant_identifier_names
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

//Getting air_speed
      Map wind = data['wind'];
      // ignore: non_constant_identifier_names
      double getAir_speed = wind["speed"] / 0.27777777777778;

      //Getting Description
      // ignore: non_constant_identifier_names
      List weather_data = data['weather'];
      // ignore: non_constant_identifier_names
      Map weather_main_data = weather_data[0];
      // ignore: non_constant_identifier_names
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      //Assigning Values
      temp = getTemp.toString(); //*c
      humidity = getHumidity; //*%
      air_speed = getAir_speed.toString(); //*km/hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }
  }
}
