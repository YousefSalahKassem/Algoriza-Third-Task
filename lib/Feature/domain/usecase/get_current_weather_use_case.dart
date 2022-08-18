import 'package:dartz/dartz.dart';
import 'package:weather/Feature/domain/repository/base_weather_repository.dart';

import '../../../Core/error/failure.dart';
import '../entity/current_weather.dart';

class GetCurrentWeatherUseCase {
  final BaseWeatherRepository _repository;

  GetCurrentWeatherUseCase(this._repository);

  Future<Either<Failure, CurrentWeather>> getWeather() async {
    return await _repository.getWeather();
  }
}