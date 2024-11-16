import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/sing_in_screen.dart';
import 'package:task_manager_get_x/data/data_controller/auth_controller.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/utils/debug_print.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);
      Map<String, String> headers = {
        'token': AuthController.accessToken.toString(),
      };

      final  response = await get(
        uri,
        headers: headers,
      );

      responsePrint(url, response.statusCode, response.body);

      final decodeData = jsonDecode(response.body);

      if (response.statusCode == 200 && decodeData['status'] == 'success') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodeData,
        );
      } else if (response.statusCode == 401 && decodeData['status'] == 'unauthorized') {
        Get.offAllNamed(SingInScreen.name);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: decodeData['data'],
        );
      } else if(response.statusCode == 404 && decodeData['status'] == 'fail'){
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: decodeData['data'],
        );
      }
      else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMassage: 'please try again');
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);

      debugPrint(url);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': AuthController.accessToken.toString(),
      };

      final  response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      responsePrint(url, response.statusCode, response.body);
      requestCheck(url, headers, body!);

      final decodeData = jsonDecode(response.body);
      if (response.statusCode == 200 || decodeData['status'] == 'success') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodeData,
        );
      } else if (response.statusCode == 401 || decodeData['status'] == 'unauthorized') {
        Get.offAllNamed(SingInScreen.name);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: decodeData['data'],
        );
      } else if(response.statusCode == 404 || decodeData['status'] == 'fail'){
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: decodeData['data'],
        );
      }
      else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMassage: 'please try again');
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }
}
