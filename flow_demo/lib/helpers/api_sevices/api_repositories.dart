import 'package:flow_demo/responses/images_response.dart';

import 'api_constants.dart';
import 'api_sevice.dart';

class ApiRepository {

  final _apiService = ApiService();
  /// To get images for different envs
  /// For mobile per page 10 images
  /// For web per page 100 images
  Future<ApiResponse<ImagesResponse>> getImageListings(String pageNumber) async {
    var response = await _apiService.get(ApiConstants.getImages + pageNumber);
    if (response!=null&&(response["status"] == 200 || response["status"] == 201)) {
      return ApiResponse.completed(ImagesResponse.fromJson(response["response"]));
    }else {
      return ApiResponse.error(response["response"]["message"]);
    }
  }
}