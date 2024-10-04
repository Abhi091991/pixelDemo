import '../auth/images_view_screen.dart';
import '../auth/splash_view_screen.dart';

class Routes {
  static var splash = '/splash';
  static var imagesDisplay = '/imagesDisplay';


  static var routeMap={
    splash: (context) =>  SplashScreen(),
    imagesDisplay: (context) => const ImagesViewScreen(),
  };
}