import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/language_cubit.dart';
import 'package:hungerz_store/theme_cubit.dart';

class ThemeList {
  final String? title;
  final String? subtitle;

  ThemeList({this.title, this.subtitle});
}

class LanguageList {
  final String? title;

  LanguageList({this.title});
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late LanguageCubit _languageCubit;
  late ThemeCubit _themeCubit;
  String? selectedLocal;
  String? selectedTheme;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<LanguageList> language = <LanguageList>[
      LanguageList(
        title: locale.englishh,
      ),
      LanguageList(
        title: locale.arabicc,
      ),
      LanguageList(
        title: locale.frenchh,
      ),
      LanguageList(
        title: locale.indonesiann,
      ),
      LanguageList(
        title: locale.portuguesee,
      ),
      LanguageList(
        title: locale.spanishh,
      )
    ];
    final List<ThemeList> themes = <ThemeList>[
      ThemeList(
        title: AppLocalizations.of(context)!.darkMode,
        subtitle: AppLocalizations.of(context)!.darkText,
      ),
      ThemeList(
        title: AppLocalizations.of(context)!.lightMode,
        subtitle: AppLocalizations.of(context)!.lightText,
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(AppLocalizations.of(context)!.settings!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500)),
        titleSpacing: 0.0,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 57.7,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                //color: kCardBackgroundColor,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.display!,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.08),
                  ),
                ),
              ),
              // RadioButtonGroup(
              //     activeColor: kMainColor,
              //     labelStyle: Theme.of(context).textTheme.caption,
              //     onSelected: (selectedThemes) {
              //       if (selectedThemes ==
              //           AppLocalizations.of(context).darkMode) {
              //         selectedTheme = AppLocalizations.of(context).darkMode;
              //       } else if (selectedThemes ==
              //           AppLocalizations.of(context).lightMode) {
              //         selectedTheme = AppLocalizations.of(context).lightMode;
              //       }
              //     },
              //     labels: themes.map((e) => e.title).toList(),
              //     itemBuilder: (Radio radioButton, Text title, int i) {
              //       return Column(
              //         children: <Widget>[
              //           Container(
              //             height: 65.0,
              //             color: Theme.of(context).scaffoldBackgroundColor,
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 8.0),
              //               child: ListTile(
              //                 trailing: radioButton,
              //                 title: Text(
              //                   themes[i].title,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .headline6
              //                       .copyWith(
              //                           fontSize: 18.3,
              //                           color: Theme.of(context)
              //                               .secondaryHeaderColor),
              //                 ),
              //                 subtitle: Text(
              //                   themes[i].subtitle,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .caption
              //                       .copyWith(
              //                           color: Theme.of(context)
              //                               .secondaryHeaderColor),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 5.0)
              //         ],
              //       );
              //     }),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: themes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    value: themes[index].title,
                    title: Text(
                      themes[index].title!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      themes[index].subtitle!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    groupValue: selectedTheme,
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedTheme = value;
                      });
                    },
                  );
                },
              ),
              Container(
                height: 58.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.selectLanguage!,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.08),
                  ),
                ),
              ),
              // RadioButtonGroup(
              //   activeColor: kMainColor,
              //   labelStyle: Theme.of(context).textTheme.caption,
              //   onSelected: (selectedLocale) {
              //     if (selectedLocale == locale.englishh) {
              //       selectedLocal = locale.englishh;
              //     } else if (selectedLocale == locale.arabicc) {
              //       selectedLocal = locale.arabicc;
              //     } else if (selectedLocale == locale.portuguesee) {
              //       selectedLocal = locale.portuguesee;
              //     } else if (selectedLocale == locale.frenchh) {
              //       selectedLocal = locale.frenchh;
              //     } else if (selectedLocale == locale.spanishh) {
              //       selectedLocal = locale.spanishh;
              //     } else if (selectedLocale == locale.indonesiann) {
              //       selectedLocal = locale.indonesiann;
              //     }
              //   },
              //   labels: language.map((e) => e.title).toList(),
              //   itemBuilder: (Radio radioButton, Text title, int i) {
              //     return Column(
              //       children: <Widget>[
              //         Container(
              //           height: 56.7,
              //           color: Theme.of(context).scaffoldBackgroundColor,
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //             child: ListTile(
              //               trailing: radioButton,
              //               title: Text(
              //                 language[i].title,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .headline6
              //                     .copyWith(
              //                         fontSize: 18.3,
              //                         color: Theme.of(context)
              //                             .secondaryHeaderColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: 5.0)
              //       ],
              //     );
              //   },
              // ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: language.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    value: language[index].title,
                    groupValue: selectedLocal,
                    title: Text(
                      language[index].title!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedLocal = value;
                      });
                    },
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(
                text: AppLocalizations.of(context)!.continueText,
                onTap: () {
                  if (selectedLocal == locale.englishh) {
                    _languageCubit.selectEngLanguage();
                  } else if (selectedLocal == locale.arabicc) {
                    _languageCubit.selectArabicLanguage();
                  } else if (selectedLocal == locale.portuguesee) {
                    _languageCubit.selectPortugueseLanguage();
                  } else if (selectedLocal == locale.frenchh) {
                    _languageCubit.selectFrenchLanguage();
                  } else if (selectedLocal == locale.spanishh) {
                    _languageCubit.selectSpanishLanguage();
                  } else if (selectedLocal == locale.indonesiann) {
                    _languageCubit.selectIndonesianLanguage();
                  }
                  if (selectedTheme == AppLocalizations.of(context)!.darkMode) {
                    _themeCubit.selectDarkTheme();
                  } else if (selectedTheme ==
                      AppLocalizations.of(context)!.lightMode) {
                    _themeCubit.selectLightTheme();
                  }
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
