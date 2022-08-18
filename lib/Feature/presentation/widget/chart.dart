import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/Core/styles/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:weather/Feature/domain/entity/hourly_weather.dart';
import 'package:weather/Feature/presentation/controller/weather_bloc.dart';
import 'package:weather/Feature/presentation/controller/weather_state.dart';
import '../../../Core/utils/enums.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc,WeatherState>(
        builder: (context,state){
          switch (state.hourlyRequestState){
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return Container(
                padding: EdgeInsets.all(context.height10/2),
                height: context.height20*12,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.height20),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: context.height20,
                      spreadRadius: context.height20,
                      offset: Offset(0, context.height20),
                    ),
                  ],
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries>[
                    LineSeries<HourlyWeather,String>(
                      dataSource: state.hourlyWeather,
                      xValueMapper: (HourlyWeather weather,_) => DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(weather.time*1000,isUtc: false)),
                      yValueMapper: (HourlyWeather weather,_) => weather.temperature,

                      color: Colors.white,
                    ),
                  ],
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(state.currentMessage),
              );
            default:
              return const SizedBox();
          }
        });
  }
}
