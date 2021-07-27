import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungerz/data/datasource/remote/dio/dio_client.dart';
import 'package:hungerz/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:hungerz/data/repository/banner_repo.dart';
import 'package:hungerz/provider/banner_provider.dart';
import 'package:hungerz/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  //repository
  sl.registerLazySingleton(() => BannerRepo(dioClient: sl()));

  //provider
  sl.registerFactory(() => BannerProvider(bannerRepo: sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
