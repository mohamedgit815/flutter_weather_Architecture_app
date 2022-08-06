import 'package:flutter_weather_app/Future/Weather/Domain/Entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Weather> getWeatherByCityName(String cityName);
}