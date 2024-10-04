import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_view_modal.dart';
import '../utills/app_theme.dart';
import '../utills/common_widgets.dart';
///Splash Screen view
class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final SplashViewModal splashViewModal = Get.put(SplashViewModal());
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
      future: splashViewModal.initializeSettings(),
      builder: (context, snapshot) {
        return const Scaffold(
              backgroundColor: AppTheme.appThemeColor,
              body:  SafeArea(
                child: Stack(
                  children: [
                    ColoredBox(color: AppTheme.appThemeColor),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Stack(alignment: Alignment.center,
                              children: [
                                GetCommonText(title: "Pixel Art Demo ", size: 40, color: Colors.white, fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }
}