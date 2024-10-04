import 'package:flow_demo/controllers/images_view_modal.dart';
import 'package:get/get.dart';

///Image screen view binding
class ImagesViewScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ImagesViewModal());
  }

}