// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_error_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerificationErrorData {
  List<String>? get errors => throw _privateConstructorUsedError;
  Map<String, VerificationErrorData>? get children =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerificationErrorDataCopyWith<VerificationErrorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationErrorDataCopyWith<$Res> {
  factory $VerificationErrorDataCopyWith(VerificationErrorData value,
          $Res Function(VerificationErrorData) then) =
      _$VerificationErrorDataCopyWithImpl<$Res, VerificationErrorData>;
  @useResult
  $Res call(
      {List<String>? errors, Map<String, VerificationErrorData>? children});
}

/// @nodoc
class _$VerificationErrorDataCopyWithImpl<$Res,
        $Val extends VerificationErrorData>
    implements $VerificationErrorDataCopyWith<$Res> {
  _$VerificationErrorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Map<String, VerificationErrorData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationErrorDataImplCopyWith<$Res>
    implements $VerificationErrorDataCopyWith<$Res> {
  factory _$$VerificationErrorDataImplCopyWith(
          _$VerificationErrorDataImpl value,
          $Res Function(_$VerificationErrorDataImpl) then) =
      __$$VerificationErrorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? errors, Map<String, VerificationErrorData>? children});
}

/// @nodoc
class __$$VerificationErrorDataImplCopyWithImpl<$Res>
    extends _$VerificationErrorDataCopyWithImpl<$Res,
        _$VerificationErrorDataImpl>
    implements _$$VerificationErrorDataImplCopyWith<$Res> {
  __$$VerificationErrorDataImplCopyWithImpl(_$VerificationErrorDataImpl _value,
      $Res Function(_$VerificationErrorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
    Object? children = freezed,
  }) {
    return _then(_$VerificationErrorDataImpl(
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as Map<String, VerificationErrorData>?,
    ));
  }
}

/// @nodoc

class _$VerificationErrorDataImpl extends _VerificationErrorData {
  const _$VerificationErrorDataImpl(
      {final List<String>? errors,
      final Map<String, VerificationErrorData>? children})
      : _errors = errors,
        _children = children,
        super._();

  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, VerificationErrorData>? _children;
  @override
  Map<String, VerificationErrorData>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableMapView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'VerificationErrorData(errors: $errors, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationErrorDataImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationErrorDataImplCopyWith<_$VerificationErrorDataImpl>
      get copyWith => __$$VerificationErrorDataImplCopyWithImpl<
          _$VerificationErrorDataImpl>(this, _$identity);
}

abstract class _VerificationErrorData extends VerificationErrorData {
  const factory _VerificationErrorData(
          {final List<String>? errors,
          final Map<String, VerificationErrorData>? children}) =
      _$VerificationErrorDataImpl;
  const _VerificationErrorData._() : super._();

  @override
  List<String>? get errors;
  @override
  Map<String, VerificationErrorData>? get children;
  @override
  @JsonKey(ignore: true)
  _$$VerificationErrorDataImplCopyWith<_$VerificationErrorDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
