import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/app_config.dart';
import 'package:movie_app/services/http_service.dart';
import 'package:movie_app/services/movie_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.onInitializationComplete})
      : super(key: key);
  final VoidCallback onInitializationComplete;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (_) => _setup().then(
        (_) => widget.onInitializationComplete(),
      ),
    );
    super.initState();
  }

  Future<void> _setup() async {
    final GetIt getIt = GetIt.instance;

    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        API_KEY: configData["API_KEY"],
        BASE_API_URL: configData["BASE_API_URL"],
        BASE_IMAGE_API_URL: configData["BASE_IMAGE_API_URL"],
      ),
    );
    getIt.registerSingleton<HTTPSerivce>(HTTPSerivce());
    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      home: Center(
        child: LoadingScreen(),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo_loading.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
