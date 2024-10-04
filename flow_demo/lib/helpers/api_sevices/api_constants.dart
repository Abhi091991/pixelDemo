import 'package:flutter/foundation.dart';

class ApiConstants {
  static String baseUrl = "";  // Stage URL
///To set up for different environments like: development,staging and production
  static void setBaseUrl({bool development = false, bool staging = false, bool production = false}) {
    if (development == true) {
      baseUrl = "https://pixabay.com/api/";
    }
    else if (staging == true) {
      baseUrl = "https://pixabay.com/api/";
    }
    else if (production == true) {
      baseUrl = "https://pixabay.com/api/";
    }
  }
  /// To get images for different envs
  /// For mobile per page 10 images
  /// For web per page 100 images
  static String getImages= kIsWeb?"?key=46323379-93f06a5542281f408ed514b2e&q=yellow+flowers&image_type=photo&pretty=true&per_page=100&page":"?key=46323379-93f06a5542281f408ed514b2e&q=yellow+flowers&image_type=photo&pretty=true&per_page=10&page";
}
