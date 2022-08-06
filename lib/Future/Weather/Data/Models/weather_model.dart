import 'package:flutter_weather_app/Future/Weather/Domain/Entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required int id ,
    required int pressure ,
    required String cityName ,
    required String main ,
    required String description
}) : super(id , pressure , cityName , main , description);

  factory WeatherModel.fromJson(Map<String,dynamic>json) {
    return WeatherModel(
        id: json['id'] ,
        pressure: json['main']['pressure'] ,
        cityName: json['name'] ,
        main: json['weather'][0]['main'] ,
        description: json['weather'][0]['description']
    );
  }
}