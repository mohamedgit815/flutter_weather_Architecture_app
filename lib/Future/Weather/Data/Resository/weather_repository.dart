import 'package:flutter_weather_app/Future/Weather/Data/DataSource/remote_data_source.dart';
import 'package:flutter_weather_app/Future/Weather/Domain/Entities/weather.dart';
import 'package:flutter_weather_app/Future/Weather/Domain/Repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    return (await remoteDataSource.getWeatherByCountryName(cityName));
  }

}