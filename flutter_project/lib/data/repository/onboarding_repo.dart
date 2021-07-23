import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/data/datasource/remote/dio/dio_client.dart';
import 'package:hungerz/data/datasource/remote/exception/api_error_handler.dart';
import 'package:hungerz/data/model/response/base/api_response.dart';
import 'package:hungerz/data/model/response/onboarding_model.dart';
import 'package:hungerz/localization/language_constrants.dart';
import 'package:hungerz/utill/images.dart';

class OnBoardingRepo {
  final DioClient dioClient;

  OnBoardingRepo({@required this.dioClient});

  Future<ApiResponse> getOnBoardingList(BuildContext context) async {
    try {
      List<OnBoardingModel> onBoardingList = [
        OnBoardingModel(
            Images.onboarding_one,
            getTransd('make_your_choice_order', context),
            getTransd('you_can_choice_the_best', context)),
        OnBoardingModel(
            Images.onboarding_two,
            getTransd('select_delivery_location', context),
            getTransd('select_accurate_location', context)),
        OnBoardingModel(
            Images.onboarding_three,
            getTransd('delivery_to_your_home', context),
            getTransd('get_food_delivery_at_home', context)),
      ];

      Response response = Response(
          requestOptions: RequestOptions(path: ''),
          data: onBoardingList,
          statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
