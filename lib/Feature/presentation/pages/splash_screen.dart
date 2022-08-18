import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/Core/styles/colors.dart';
import 'package:weather/Core/styles/dimensions.dart';
import 'package:weather/Core/styles/images.dart';
import 'package:weather/Core/utils/routes.dart';
import 'package:weather/Feature/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => AppRoute.pushReplacement(const HomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSplash,
      body: Center(
        child: Lottie.asset(
          splash,
          fit: BoxFit.cover,
          width: context.screenHeight,
          height: context.screenWidth,
        ),
      ),
    );
  }
}
