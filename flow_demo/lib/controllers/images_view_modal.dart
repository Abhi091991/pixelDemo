import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/api_sevices/api_repositories.dart';
import '../responses/images_response.dart';

/// Image View Modal
class ImagesViewModal extends GetxController {
  var apiRepo= ApiRepository();
  var isLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  int _currentPage = 1;
  var imagesList= <Hit>[].obs;

 @override
  void onInit() {
    super.onInit();
    loadImages();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadImages();
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
  void showLoader(bool loading){
    isLoading.value = loading;
    isLoading.refresh();
    update();
  }
  /// To get images for different envs
  /// For mobile per page 10 images
  /// For web per page 100 images
  Future<void> loadImages() async {
   showLoader(true);
   await apiRepo.getImageListings(_currentPage.toString()).then((response){
     if(response.data!=null){
       imagesList.addAll(response.data!.hits!);
       imagesList.refresh();
       update();
       _currentPage++;
     }
   });
   showLoader(false);
  }

}