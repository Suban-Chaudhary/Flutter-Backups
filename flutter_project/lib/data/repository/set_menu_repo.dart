import 'package:flutter/material.dart';
import 'package:hungerz/data/datasource/remote/dio/dio_client.dart';
import 'package:hungerz/data/datasource/remote/exception/api_error_handler.dart';
import 'package:hungerz/data/model/response/base/api_response.dart';
import 'package:hungerz/utill/app_constants.dart';

class SetMenuRepo {
  final DioClient dioClient;
  SetMenuRepo({@required this.dioClient});

  Future<ApiResponse> getSetMenuList() async {
    try {
      final response = await dioClient.get(AppConstants.SET_MENU_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
