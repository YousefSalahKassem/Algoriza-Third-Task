import 'package:weather/Feature/domain/entity/current_weather.dart';

class WeatherModel extends CurrentWeather {
  const WeatherModel(
      {required super.cityName,
      required super.country,
      required super.temperature,
      required super.weatherDescription,
      required super.feelsLikeTemperature,
      required super.humidity,
      required super.pressure,
      required super.sunrise,
      required super.sunset,
      required super.speed,
      required super.maxTemperature,
      required super.minTemperature
      });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      country: json['sys']['country'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      feelsLikeTemperature: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      speed: json['wind']['speed'],
      maxTemperature: json['main']['temp_max'],
      minTemperature: json['main']['temp_min'],
    );
  }
}
