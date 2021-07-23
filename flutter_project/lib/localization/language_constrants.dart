import 'package:flutter/material.dart';
import 'package:hungerz/localization/app_localization.dart';

String getTransd(String key, BuildContext context) {
  return AppLocalization.of(context).trans(key);
}
