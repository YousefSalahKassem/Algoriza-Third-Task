import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Feature/presentation/controller/weather_bloc.dart';
import 'package:weather/Feature/presentation/controller/weather_event.dart';
import 'package:weather/Feature/presentation/widget/background.dart';
import 'package:weather/Feature/presentation/widget/build_body.dart';
import 'package:weather/Feature/presentation/widget/build_drawer.dart';
import '../../../Core/service/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<WeatherBloc>()
          ..add(GetCurrentWeatherEvent())
          ..add(GetDailyWeatherEvent())
          ..add(GetHourlyWeatherEvent()),
        child: Scaffold(
          drawer: const BuildDrawer(),
          body: Stack(
            children: const [
              Background(),
              BuildBody()
            ],
          ),
        ));
  }
}
