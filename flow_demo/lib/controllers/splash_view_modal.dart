import 'package:flow_demo/utills/routes.dart';
import 'package:get/get.dart';


class SplashViewModal extends GetxController {
  Future<void> initializeSettings() async {
    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.imagesDisplay);
  }
}