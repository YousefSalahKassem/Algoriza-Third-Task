import 'package:weather/Feature/domain/entity/hourly_weather.dart';

class HourlyWeatherModel extends HourlyWeather {
  HourlyWeatherModel(
      {required super.icon,
      required super.time,
      required super.temperature,
      required super.humidity
      });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      icon: json['weather'][0]['icon'],
      time: json['dt'],
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toDouble(),
    );
  }
}
