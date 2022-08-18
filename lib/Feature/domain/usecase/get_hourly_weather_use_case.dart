import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../entity/hourly_weather.dart';
import '../repository/base_weather_repository.dart';

class GetHourlyWeatherUseCase {
  final BaseWeatherRepository _repository;

  GetHourlyWeatherUseCase(this._repository);

  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather() async {
    return await _repository.getHourlyWeather();
  }
}