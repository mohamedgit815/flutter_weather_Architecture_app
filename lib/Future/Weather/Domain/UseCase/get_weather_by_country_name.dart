import 'package:flutter_weather_app/Future/Weather/Domain/Entities/weather.dart';
import 'package:flutter_weather_app/Future/Weather/Domain/Repository/base_weather_repository.dart';

class GetWeatherByCountryName {
  final BaseWeatherRepository repository;

  GetWeatherByCountryName(this.repository);

  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherByCityName(cityName);
  }
}