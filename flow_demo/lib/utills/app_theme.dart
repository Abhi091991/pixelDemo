import 'package:flutter/material.dart';

///Custom Colors for large scale applications
class AppTheme {
  AppTheme._();

  static const appThemeButtonColor = Color(0xff24A0ED);
  static const appThemeColor = Color(0xff0083FA);
  static const appThemeColorDark = Color(0xff0075E0);
  static const appRedButtonColor = Color(0xffD11A2A);
  static const appGreenButtonColor = Color(0xff13A806);
  static const appGreenDarkButtonColor = Color(0xff2E7D32);

  static const appThemeLightBackgroundColor = Color(0xffffffff);
  static const appThemeDarkBackgroundColor = Color(0xff141414);

  static const appLightThemeTextColor = Color(0xff000000);
  static const appLightThemeSubTextColor = Color(0xff5D5D5D);
  static const appLightThemeHeadingTextColor = Color(0xff3D3D3D);
  static const appLightThemeEmailHeadingTextColor = Color(0xff4f4f4f);
  static const appDarkThemeTextColor = Color(0xffffffff);
  static const appBarCancelTextColor = Color(0xff6B7280);
  static const appBorderColor = Color(0xffE8E8E8);

  static Color appTextLightGrayColor = Colors.grey.shade500;
  static Color appTextDarkGrayColor = Colors.grey.shade700;

  static const fontFamilyNamePrimary = 'Figtree';
  static const fontFamilyNameSecondary = 'Inter';

  static Color appThemeBoardBackgroundColor = Colors.grey.shade900;

}
/// Application theme properties
class MyThemes {
  static final darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppTheme.appThemeDarkBackgroundColor,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(primary: AppTheme.appThemeButtonColor),
  );

  static final lightTheme = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppTheme.appThemeLightBackgroundColor,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(primary: AppTheme.appThemeButtonColor),
      focusColor: AppTheme.appThemeButtonColor
  );

}
/// Utilities for application properties
class DeviceUtil {
  DeviceUtil._();

  static bool isDarkMode(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }
  static Color getBackgroundColor(BuildContext context) {
    if (isDarkMode(context)) {
      return AppTheme.appThemeDarkBackgroundColor;
    }
    else {
      return AppTheme.appThemeLightBackgroundColor;
    }
  }

}