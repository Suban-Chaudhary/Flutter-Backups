import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'union.freezed.dart';
// part 'main.g.dart';

@freezed
class MyClass with _$MyClass {
  factory MyClass({String? a, int? b}) = _MyClass;
}
