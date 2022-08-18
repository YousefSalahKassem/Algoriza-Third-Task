import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/Core/network/api_constance.dart';
import 'package:weather/Feature/data/model/daily_weather_model.dart';
import 'package:weather/Feature/data/model/hourly_weather_model.dart';
import 'package:weather/Feature/data/model/weather_model.dart';
import '../../../Core/error/exceptions.dart';
import '../../../Core/network/error_message_model.dart';


abstract class BaseWeatherDataSource {
  Future<WeatherModel> getWeather();
  Future<WeatherModel> getWeatherByCity(String city);
  Future<List<HourlyWeatherModel>> getHourlyWeather();
  Future<List<DailyWeatherModel>> getDailyWeather();
}

class WeatherRemoteDataSource extends BaseWeatherDataSource {

  @override
  Future<WeatherModel> getWeather() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    final response = await Dio().get(ApiConstance.currentWeatherByCoordinates(latitude, longitude));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<WeatherModel> getWeatherByCity(String city) async{
    final response = await Dio().get(ApiConstance.currentWeather(city));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HourlyWeatherModel>> getHourlyWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;

    final response = await Dio().get(ApiConstance.hourlyWeather(latitude, longitude));
    if (response.statusCode == 200) {
      return List<HourlyWeatherModel>.from(response.data['hourly'].map((item) => HourlyWeatherModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<DailyWeatherModel>> getDailyWeather() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    final response = await Dio().get(ApiConstance.dailyWeather(latitude, longitude));
    if (response.statusCode == 200) {
      return List<DailyWeatherModel>.from(response.data['daily'].map((item) => DailyWeatherModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }



}