import 'package:get_it/get_it.dart';
import 'package:weather/Feature/data/datasource/base_weather_data_source.dart';
import 'package:weather/Feature/domain/repository/base_weather_repository.dart';
import 'package:weather/Feature/domain/usecase/get_current_weather_use_case.dart';
import 'package:weather/Feature/domain/usecase/get_daily_weather_use_case.dart';
import 'package:weather/Feature/domain/usecase/get_hourly_weather_use_case.dart';
import 'package:weather/Feature/domain/usecase/get_weather_by_ciry_use_case.dart';
import '../../Feature/data/repository/weather_repository.dart';
import '../../Feature/presentation/controller/weather_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init(){

    // register data sources
    sl.registerLazySingleton<BaseWeatherDataSource>(() => WeatherRemoteDataSource());

    // register repositories
    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(weatherDataSource: sl()));

    // register use cases
    sl.registerLazySingleton<GetCurrentWeatherUseCase>(() => GetCurrentWeatherUseCase(sl()));
    sl.registerLazySingleton<GetWeatherByCityUserCase>(() => GetWeatherByCityUserCase(sl()));
    sl.registerLazySingleton<GetDailyWeatherUseCase>(() => GetDailyWeatherUseCase(sl()));
    sl.registerLazySingleton<GetHourlyWeatherUseCase>(() => GetHourlyWeatherUseCase(sl()));

    // register blocs
    sl.registerFactory<WeatherBloc>(() => WeatherBloc(sl(), sl(), sl(), sl()));
  }
}