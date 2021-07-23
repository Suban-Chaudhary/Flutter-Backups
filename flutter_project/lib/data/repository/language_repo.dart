import 'package:flutter/material.dart';
import 'package:hungerz/data/model/response/language_model.dart';
import 'package:hungerz/utill/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstants.languages;
  }
}
