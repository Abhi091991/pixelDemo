import 'package:flow_demo/utills/app_pages.dart';
import 'package:flow_demo/utills/app_theme.dart';
import 'package:flow_demo/utills/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/splash_view_screen.dart';
import 'helpers/api_sevices/api_constants.dart';


void main() async {
  ApiConstants.setBaseUrl(development: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: Routes.splash,
        getPages: AppPages.pages,
        routes: Routes.routeMap,
        home: SplashScreen(),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

