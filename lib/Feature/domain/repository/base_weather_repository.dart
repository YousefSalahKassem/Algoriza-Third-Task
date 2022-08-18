import 'package:weather/Feature/domain/entity/current_weather.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/Feature/domain/entity/daily_weather.dart';
import 'package:weather/Feature/domain/entity/hourly_weather.dart';
import '../../../Core/error/failure.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, CurrentWeather>> getWeather();
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(String city);
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather();
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather();
}