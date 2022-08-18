import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/Core/styles/colors.dart';
import 'package:weather/Core/styles/dimensions.dart';
import '../../../Core/styles/changeThemes/theme_bloc.dart';
import '../../../Core/styles/images.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state){
          return LottieBuilder.asset(
            state.themeData.primaryColor==secondaryLightColor?lightBackground:darkBackground,
            fit: BoxFit.cover,
            height: context.screenHeight,
            width: context.screenWidth,
          );
        }
    );
  }
}
