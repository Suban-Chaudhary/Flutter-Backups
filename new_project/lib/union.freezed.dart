// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyClassTearOff {
  const _$MyClassTearOff();

  _MyClass call({String? a, int? b}) {
    return _MyClass(
      a: a,
      b: b,
    );
  }
}

/// @nodoc
const $MyClass = _$MyClassTearOff();

/// @nodoc
mixin _$MyClass {
  String? get a => throw _privateConstructorUsedError;
  int? get b => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyClassCopyWith<MyClass> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyClassCopyWith<$Res> {
  factory $MyClassCopyWith(MyClass value, $Res Function(MyClass) then) =
      _$MyClassCopyWithImpl<$Res>;
  $Res call({String? a, int? b});
}

/// @nodoc
class _$MyClassCopyWithImpl<$Res> implements $MyClassCopyWith<$Res> {
  _$MyClassCopyWithImpl(this._value, this._then);

  final MyClass _value;
  // ignore: unused_field
  final $Res Function(MyClass) _then;

  @override
  $Res call({
    Object? a = freezed,
    Object? b = freezed,
  }) {
    return _then(_value.copyWith(
      a: a == freezed
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as String?,
      b: b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MyClassCopyWith<$Res> implements $MyClassCopyWith<$Res> {
  factory _$MyClassCopyWith(_MyClass value, $Res Function(_MyClass) then) =
      __$MyClassCopyWithImpl<$Res>;
  @override
  $Res call({String? a, int? b});
}

/// @nodoc
class __$MyClassCopyWithImpl<$Res> extends _$MyClassCopyWithImpl<$Res>
    implements _$MyClassCopyWith<$Res> {
  __$MyClassCopyWithImpl(_MyClass _value, $Res Function(_MyClass) _then)
      : super(_value, (v) => _then(v as _MyClass));

  @override
  _MyClass get _value => super._value as _MyClass;

  @override
  $Res call({
    Object? a = freezed,
    Object? b = freezed,
  }) {
    return _then(_MyClass(
      a: a == freezed
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as String?,
      b: b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_MyClass with DiagnosticableTreeMixin implements _MyClass {
  _$_MyClass({this.a, this.b});

  @override
  final String? a;
  @override
  final int? b;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyClass(a: $a, b: $b)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyClass'))
      ..add(DiagnosticsProperty('a', a))
      ..add(DiagnosticsProperty('b', b));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyClass &&
            (identical(other.a, a) ||
                const DeepCollectionEquality().equals(other.a, a)) &&
            (identical(other.b, b) ||
                const DeepCollectionEquality().equals(other.b, b)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(a) ^
      const DeepCollectionEquality().hash(b);

  @JsonKey(ignore: true)
  @override
  _$MyClassCopyWith<_MyClass> get copyWith =>
      __$MyClassCopyWithImpl<_MyClass>(this, _$identity);
}

abstract class _MyClass implements MyClass {
  factory _MyClass({String? a, int? b}) = _$_MyClass;

  @override
  String? get a => throw _privateConstructorUsedError;
  @override
  int? get b => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MyClassCopyWith<_MyClass> get copyWith =>
      throw _privateConstructorUsedError;
}
