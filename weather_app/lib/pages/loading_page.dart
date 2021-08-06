import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/app_config.dart';
import 'package:weather_app/services/http_service.dart';
import 'package:weather_app/services/weather_service.dart';

class LoadingPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const LoadingPage({Key? key, required this.onInitializationComplete})
      : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2))
        .then((_) => _setup)
        .then((_) => widget.onInitializationComplete());
    super.initState();
  }

  Future<void> _setup() async {
    GetIt getIt = GetIt.instance;
    final configFile = await rootBundle.loadString("assets/config/config.json");
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        apiKey: configData["API_KEY"],
        baseApiUrl: configData["BASE_API_URL"],
      ),
    );
    getIt.registerSingleton<HTTPService>(HTTPService());
    getIt.registerSingleton<WeatherService>(WeatherService());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
