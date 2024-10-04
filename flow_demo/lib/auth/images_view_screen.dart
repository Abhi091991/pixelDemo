import 'package:flow_demo/utills/app_theme.dart';
import 'package:flow_demo/utills/common_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/images_view_modal.dart';
import '../utills/app_constants.dart';

/// To display all images UI
class ImagesViewScreen extends StatelessWidget {
  const ImagesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImagesViewModal imagesViewModal = Get.put(ImagesViewModal());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(()=> Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GetCommonText(title: AppConstants.imageScreenTitle, size: 30, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w200,fontStyle: FontStyle.italic,),
                ),
                Expanded(
                  child: GridView.builder(
                   controller: imagesViewModal.scrollController,
                   gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4:2, // Number of columns
                     childAspectRatio: 1, // Aspect ratio of each item
                   ),
                   itemCount: imagesViewModal.imagesList.length,
                   itemBuilder: (context, index) {
                     return Card(
                       child: Stack(
                         fit: StackFit.expand,
                         children: [
                           Image.network(kIsWeb?imagesViewModal.imagesList[index].largeImageUrl??"":imagesViewModal.imagesList[index].previewUrl??"",fit: BoxFit.cover,),
                           Positioned(left: 10,bottom: 5,child: Row(
                             children: [
                               const Icon(Icons.thumb_up_alt),
                               GetCommonText(title: imagesViewModal.imagesList[index].likes.toString(), size: 15, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600)
                             ],
                           )),
                           Positioned(right: 10,bottom: 5,child: Row(
                             children: [
                               const Icon(Icons.remove_red_eye),
                               GetCommonText(title: imagesViewModal.imagesList[index].views.toString(), size: 15, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600)
                             ],
                           ))
                         ],
                       ),
                     );
                   },
                           ),
                ),
              ],
            )),
            Obx(()=>GetCommonLoader(isVisible: imagesViewModal.isLoading.value ))
          ],
        ),
      ),
    );
  }
}