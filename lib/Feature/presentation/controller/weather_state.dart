import 'package:equatable/equatable.dart';
import 'package:weather/Core/utils/enums.dart';

import '../../domain/entity/current_weather.dart';
import '../../domain/entity/daily_weather.dart';
import '../../domain/entity/hourly_weather.dart';

class WeatherState extends Equatable {
  final CurrentWeather? currentWeather;
  final CurrentWeather? currentWeatherByCity;
  final List<DailyWeather> dailyWeather;
  final List<HourlyWeather> hourlyWeather;

  final RequestState currentRequestState;
  final RequestState dailyRequestState;
  final RequestState hourlyRequestState;
  final RequestState currentRequestStateByCity;

  final String currentMessage;
  final String dailyMessage;
  final String hourlyMessage;
  final String currentMessageByCity;

  const WeatherState({
    this.currentWeather,
    this.currentWeatherByCity,
    this.dailyWeather = const [],
    this.hourlyWeather = const [],
    this.currentRequestState = RequestState.loading,
    this.dailyRequestState = RequestState.loading,
    this.hourlyRequestState = RequestState.loading,
    this.currentRequestStateByCity = RequestState.loading,
    this.currentMessageByCity = '',
    this.currentMessage = '',
    this.dailyMessage = '',
    this.hourlyMessage = '',
  });

  WeatherState copyWith
  ({
    CurrentWeather? currentWeather,
    CurrentWeather? currentWeatherByCity,
    List<DailyWeather>? dailyWeather,
    List<HourlyWeather>? hourlyWeather,
    RequestState? currentRequestState,
    RequestState? dailyRequestState,
    RequestState? hourlyRequestState,
    RequestState? currentRequestStateByCity,
    String? currentMessage,
    String? dailyMessage,
    String? hourlyMessage,
    String? currentMessageByCity,
  }) {
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      currentWeatherByCity: currentWeatherByCity ?? this.currentWeatherByCity,
      dailyWeather: dailyWeather ?? this.dailyWeather,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      currentRequestState: currentRequestState ?? this.currentRequestState,
      dailyRequestState: dailyRequestState ?? this.dailyRequestState,
      hourlyRequestState: hourlyRequestState ?? this.hourlyRequestState,
      currentRequestStateByCity: currentRequestStateByCity ?? this.currentRequestStateByCity,
      currentMessage: currentMessage ?? this.currentMessage,
      dailyMessage: dailyMessage ?? this.dailyMessage,
      hourlyMessage: hourlyMessage ?? this.hourlyMessage,
      currentMessageByCity: currentMessageByCity ?? this.currentMessageByCity,
    );
  }

@override
List<Object?> get props =>
    [
      currentWeather,
      dailyWeather,
      hourlyWeather,
      currentWeatherByCity,
      currentRequestState,
      dailyRequestState,
      hourlyRequestState,
      currentRequestStateByCity,
      currentMessage,
      dailyMessage,
      hourlyMessage,
      currentMessageByCity,
    ];}

