import 'package:dartz/dartz.dart';
import 'package:weather/Core/error/failure.dart';
import 'package:weather/Feature/data/datasource/base_weather_data_source.dart';
import 'package:weather/Feature/domain/entity/current_weather.dart';
import 'package:weather/Feature/domain/entity/daily_weather.dart';
import 'package:weather/Feature/domain/entity/hourly_weather.dart';
import '../../../Core/error/exceptions.dart';
import '../../domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository{
  final BaseWeatherDataSource weatherDataSource;

  WeatherRepository({required this.weatherDataSource});

  @override
  Future<Either<Failure, CurrentWeather>> getWeather() async {
    final result = await weatherDataSource.getWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(String city) async {
   final result = await weatherDataSource.getWeatherByCity(city);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather() async {
    final result = await weatherDataSource.getHourlyWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather() async{
    final result = await weatherDataSource.getDailyWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

}