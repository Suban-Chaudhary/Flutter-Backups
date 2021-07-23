import 'package:flutter/foundation.dart';
import 'package:hungerz/data/datasource/remote/dio/dio_client.dart';
import 'package:hungerz/data/datasource/remote/exception/api_error_handler.dart';
import 'package:hungerz/data/model/response/base/api_response.dart';
import 'package:hungerz/utill/app_constants.dart';

class NotificationRepo {
  final DioClient dioClient;

  NotificationRepo({@required this.dioClient});

  Future<ApiResponse> getNotificationList() async {
    try {
      final response = await dioClient.get('${AppConstants.NOTIFICATION_URI}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
