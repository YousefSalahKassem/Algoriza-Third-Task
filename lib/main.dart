import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/Core/service/service_locator.dart';
import 'package:weather/Core/styles/changeThemes/theme_bloc.dart';
import 'package:weather/Core/utils/preferences.dart';
import 'package:weather/Feature/presentation/pages/splash_screen.dart';
import 'Core/error/exceptions.dart';
import 'Core/utils/globals.dart';
import 'Core/utils/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  Preferences.init();
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Not Available');
    }
  }
  if (!await Geolocator.isLocationServiceEnabled()) {
  throw LocationDisabledException();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc,ThemeState>(
          builder: (context,state){
            return MaterialApp(
              title: 'Flutter Demo',
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              navigatorKey: Globals.instance.navigatorKey,
              onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
              home: const SplashScreen()
            );
          }
        ),
    );
  }
}
