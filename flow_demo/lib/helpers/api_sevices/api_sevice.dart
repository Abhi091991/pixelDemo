import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../controllers/splash_view_modal.dart';
import '../../utills/routes.dart';
import 'api_constants.dart';



class ApiService extends GetxService{


  ///Logout User
  static logoutUserFromApp() async {
    Get.snackbar(
      'Demo!',
      "Session expired, Please login Again.",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      borderRadius: 13,
      backgroundColor: Colors.red,
    );
    Get.changeTheme(ThemeData.light());
    Get.offAllNamed(Routes.imagesDisplay);
    return;
  }

  Future<dynamic> get(String url) async {
      try {
        final response = await http.get(Uri.parse(ApiConstants.baseUrl + url));
        log(response.statusCode.toString());
        log(response.body);
        if (response.statusCode == 401) {
          logoutUserFromApp();
        }
        else {
          return{"response": _returnResponse(response), "status": response.statusCode};
        }
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
  }
  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);
      case 401:
        return jsonDecode(response.body);
      case 403:
        return jsonDecode(response.body);
      case 404:
        return jsonDecode(response.body);
      case 422:
        return jsonDecode(response.body);
      case 429:
        return jsonDecode(response.body);
      case 500:
        return jsonDecode(response.body);
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
