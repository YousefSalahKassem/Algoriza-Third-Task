import 'package:dartz/dartz.dart';
import 'package:weather/Core/utils/base_use_case.dart';
import 'package:weather/Feature/domain/repository/base_weather_repository.dart';
import '../../../Core/error/failure.dart';
import '../entity/current_weather.dart';

class GetWeatherByCityUserCase extends BaseUseCase<CurrentWeather,String> {
  final BaseWeatherRepository repository;

  GetWeatherByCityUserCase(this.repository);

  @override
  Future<Either<Failure, CurrentWeather>> execute(String params) async {
    return await repository.getWeatherByCity(params);
  }
}