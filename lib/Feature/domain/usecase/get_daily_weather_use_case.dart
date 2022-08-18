import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../entity/daily_weather.dart';
import '../repository/base_weather_repository.dart';

class GetDailyWeatherUseCase {
  final BaseWeatherRepository _repository;

  GetDailyWeatherUseCase(this._repository);

  Future<Either<Failure, List<DailyWeather>>> getWeather() async {
    return await _repository.getDailyWeather();
  }
}