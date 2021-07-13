import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz_store/Auth/login_navigator.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/language_cubit.dart';
import 'package:hungerz_store/theme_cubit.dart';

void main() {
  runApp(Phoenix(child: HungerzStore()));
}

class HungerzStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return BlocBuilder<LanguageCubit, Locale>(builder: (_, locale) {
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
              ],
              debugShowCheckedModeBanner: false,
              locale: locale,
              theme: theme,
              home: LoginNavigator(),
              routes: PageRoutes().routes(),
            );
          });
        },
      ),
    );
  }
}
