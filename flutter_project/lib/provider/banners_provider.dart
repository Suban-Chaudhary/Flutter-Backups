import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hungerz/data/model/response/banner_model.dart';
import 'package:hungerz/data/model/response/base/api_response.dart';
import 'package:hungerz/data/model/response/product_model.dart';
import 'package:hungerz/data/repository/banner_repo.dart';

class BannersProvider extends StateNotifier<List<BannerModel>> {
  final BannerRepo bannerRepo;
  BannersProvider({@required this.bannerRepo}) : super(null);

  List<BannerModel> _bannerList;
  List<Product> _productList = [];

  List<BannerModel> get bannerList => _bannerList;
  List<Product> get productList => _productList;

  Future<void> getBannerList(BuildContext context, bool reload) async {
    if (bannerList == null || reload) {
      ApiResponse apiResponse = await bannerRepo.getBannerList();
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _bannerList = [];
        apiResponse.response.data.forEach((category) {
          BannerModel bannerModel = BannerModel.fromJson(category);
          if (bannerModel.productId != null) {
            getProductDetails(context, bannerModel.productId.toString());
          }
          _bannerList.add(bannerModel);
        });
      } else {
        //ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  void getProductDetails(BuildContext context, String productID) async {
    ApiResponse apiResponse = await bannerRepo.getProductDetails(productID);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _productList.add(Product.fromJson(apiResponse.response.data));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }
}
