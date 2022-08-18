import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Feature/presentation/controller/weather_event.dart';
import 'package:weather/Feature/presentation/controller/weather_state.dart';

import '../../../Core/utils/enums.dart';
import '../../domain/usecase/get_current_weather_use_case.dart';
import '../../domain/usecase/get_daily_weather_use_case.dart';
import '../../domain/usecase/get_hourly_weather_use_case.dart';
import '../../domain/usecase/get_weather_by_ciry_use_case.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetDailyWeatherUseCase getDailyWeatherUseCase;
  final GetHourlyWeatherUseCase getHourlyWeatherUseCase;
  final GetWeatherByCityUserCase getWeatherByCityUserCase;


  WeatherBloc(this.getCurrentWeatherUseCase, this.getDailyWeatherUseCase, this.getHourlyWeatherUseCase, this.getWeatherByCityUserCase)
      : super(const WeatherState()){
    on<GetCurrentWeatherEvent>(_getCurrentWeather);
    on<GetDailyWeatherEvent>(_getDailyWeather);
    on<GetHourlyWeatherEvent>(_getHourlyWeather);
    on<GetCurrentWeatherByCityEvent>(_getWeatherByCity);
  }

  Future <void> _getCurrentWeather(GetCurrentWeatherEvent event ,emit) async {
    final result = await getCurrentWeatherUseCase.getWeather();
    result.fold(
            (l) => emit(state.copyWith(currentRequestState: RequestState.error, currentMessage: l.message)),
            (r) => emit(state.copyWith(currentWeather: r, currentRequestState: RequestState.loaded))
    );
  }

  Future <void> _getDailyWeather(GetDailyWeatherEvent event ,emit) async {
    final result = await getDailyWeatherUseCase.getWeather();
    result.fold(
            (l) => emit(state.copyWith(dailyRequestState: RequestState.error, dailyMessage: l.message)),
            (r) => emit(state.copyWith(dailyWeather: r, dailyRequestState: RequestState.loaded))
    );
  }

  Future <void> _getHourlyWeather(GetHourlyWeatherEvent event ,emit) async {
    final result = await getHourlyWeatherUseCase.getHourlyWeather();
    result.fold(
            (l) => emit(state.copyWith(hourlyRequestState: RequestState.error, hourlyMessage: l.message)),
            (r) => emit(state.copyWith(hourlyWeather: r, hourlyRequestState: RequestState.loaded))
    );
  }

  Future <void> _getWeatherByCity(GetCurrentWeatherByCityEvent event ,emit) async {
    final result = await getWeatherByCityUserCase.execute(event.city);
    result.fold(
            (l) => emit(state.copyWith  (currentRequestStateByCity: RequestState.error, currentMessageByCity: l.message)),
            (r) => emit(state.copyWith(currentWeatherByCity: r, currentRequestStateByCity: RequestState.loaded))
    );
  }

}
