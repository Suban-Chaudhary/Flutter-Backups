import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'di_contanier.dart' as di;

void main() {
  di.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(Phoenix(child: Hungerz()));
}

class Hungerz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('fr'),
        const Locale('id'),
        const Locale('pt'),
        const Locale('es'),
        const Locale('it'),
        const Locale('tr'),
        const Locale('sw'),
      ],
      debugShowCheckedModeBanner: false,
      home: Settings(),
      routes: PageRoutes().routes(),
    );
  }
}
