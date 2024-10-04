import 'package:flow_demo/bindings/images_display_binding.dart';
import 'package:flow_demo/utills/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../auth/images_view_screen.dart';


/// To display app pages
/// To Bind the UI with respective ViewModals
class AppPages {
  static var initialRoute = Routes.imagesDisplay;
  static List<GetPage> pages = [
     GetPage(name: Routes.imagesDisplay, page: () => const ImagesViewScreen(), binding: ImagesViewScreenBinding()),
  ];
}