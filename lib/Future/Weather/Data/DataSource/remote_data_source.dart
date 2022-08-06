import 'package:dio/dio.dart';
import 'package:flutter_weather_app/Core/utils/constance.dart';
import 'package:flutter_weather_app/Future/Weather/Data/Models/weather_model.dart';


abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCountryName(String name);
}

class RemoteDataSource implements BaseRemoteDataSource {

  @override
  Future<WeatherModel> getWeatherByCountryName(String name) async {
    try{
      final Response<dynamic> _response = await Dio().getUri(
          Uri.parse('${AppConstance.baseUrl}/weather?q=$name&appId=${AppConstance.appKey}'));
      return WeatherModel.fromJson(_response.data);
    } catch(err) {
      throw Exception('getWeatherByCountryName: $err');
    }
  }

}