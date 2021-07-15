import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/pages/main_page.dart';

import 'pages/splash_page.dart';

void main() {
  runApp(SplashPage(
      onInitializationComplete: () => runApp(ProviderScope(child: MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {"home": (BuildContext context) => MainPage()},
    );
  }
}
