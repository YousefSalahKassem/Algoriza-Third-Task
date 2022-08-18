import 'package:flutter/material.dart';

import 'colors.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    primaryColor: secondaryLightColor,
    secondaryHeaderColor: sky,
    backgroundColor: secondaryLightColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.green
    )
  ),

  AppTheme.dark: ThemeData(
    primaryColor: secondaryDarkColor,
    secondaryHeaderColor: moon,
    backgroundColor: secondaryDarkColor,
    drawerTheme: const DrawerThemeData(
          backgroundColor: drawerDark
    )
  ),
};