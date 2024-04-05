// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentModel payment) product,
    required TResult Function() pageLoading,
    required TResult Function(AppException error) error,
    required TResult Function() purchased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentModel payment)? product,
    TResult? Function()? pageLoading,
    TResult? Function(AppException error)? error,
    TResult? Function()? purchased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentModel payment)? product,
    TResult Function()? pageLoading,
    TResult Function(AppException error)? error,
    TResult Function()? purchased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_PageLoading value) pageLoading,
    required TResult Function(_Error value) error,
    required TResult Function(_Purchased value) purchased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_PageLoading value)? pageLoading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Purchased value)? purchased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_PageLoading value)? pageLoading,
    TResult Function(_Error value)? error,
    TResult Function(_Purchased value)? purchased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentModel payment});

  $PaymentModelCopyWith<$Res> get payment;
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
  }) {
    return _then(_$_Product(
      null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res> get payment {
    return $PaymentModelCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }
}

/// @nodoc

class _$_Product extends _Product {
  const _$_Product(this.payment) : super._();

  @override
  final PaymentModel payment;

  @override
  String toString() {
    return 'PaymentState.product(payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentModel payment) product,
    required TResult Function() pageLoading,
    required TResult Function(AppException error) error,
    required TResult Function() purchased,
  }) {
    return product(payment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentModel payment)? product,
    TResult? Function()? pageLoading,
    TResult? Function(AppException error)? error,
    TResult? Function()? purchased,
  }) {
    return product?.call(payment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentModel payment)? product,
    TResult Function()? pageLoading,
    TResult Function(AppException error)? error,
    TResult Function()? purchased,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(payment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_PageLoading value) pageLoading,
    required TResult Function(_Error value) error,
    required TResult Function(_Purchased value) purchased,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_PageLoading value)? pageLoading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Purchased value)? purchased,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_PageLoading value)? pageLoading,
    TResult Function(_Error value)? error,
    TResult Function(_Purchased value)? purchased,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }
}

abstract class _Product extends PaymentState {
  const factory _Product(final PaymentModel payment) = _$_Product;
  const _Product._() : super._();

  PaymentModel get payment;
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PageLoadingCopyWith<$Res> {
  factory _$$_PageLoadingCopyWith(
          _$_PageLoading value, $Res Function(_$_PageLoading) then) =
      __$$_PageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PageLoadingCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_PageLoading>
    implements _$$_PageLoadingCopyWith<$Res> {
  __$$_PageLoadingCopyWithImpl(
      _$_PageLoading _value, $Res Function(_$_PageLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PageLoading extends _PageLoading {
  const _$_PageLoading() : super._();

  @override
  String toString() {
    return 'PaymentState.pageLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentModel payment) product,
    required TResult Function() pageLoading,
    required TResult Function(AppException error) error,
    required TResult Function() purchased,
  }) {
    return pageLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentModel payment)? product,
    TResult? Function()? pageLoading,
    TResult? Function(AppException error)? error,
    TResult? Function()? purchased,
  }) {
    return pageLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentModel payment)? product,
    TResult Function()? pageLoading,
    TResult Function(AppException error)? error,
    TResult Function()? purchased,
    required TResult orElse(),
  }) {
    if (pageLoading != null) {
      return pageLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_PageLoading value) pageLoading,
    required TResult Function(_Error value) error,
    required TResult Function(_Purchased value) purchased,
  }) {
    return pageLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_PageLoading value)? pageLoading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Purchased value)? purchased,
  }) {
    return pageLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_PageLoading value)? pageLoading,
    TResult Function(_Error value)? error,
    TResult Function(_Purchased value)? purchased,
    required TResult orElse(),
  }) {
    if (pageLoading != null) {
      return pageLoading(this);
    }
    return orElse();
  }
}

abstract class _PageLoading extends PaymentState {
  const factory _PageLoading() = _$_PageLoading;
  const _PageLoading._() : super._();
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException error});

  $AppExceptionCopyWith<$Res> get error;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppExceptionCopyWith<$Res> get error {
    return $AppExceptionCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_Error extends _Error {
  const _$_Error(this.error) : super._();

  @override
  final AppException error;

  @override
  String toString() {
    return 'PaymentState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentModel payment) product,
    required TResult Function() pageLoading,
    required TResult Function(AppException error) error,
    required TResult Function() purchased,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentModel payment)? product,
    TResult? Function()? pageLoading,
    TResult? Function(AppException error)? error,
    TResult? Function()? purchased,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentModel payment)? product,
    TResult Function()? pageLoading,
    TResult Function(AppException error)? error,
    TResult Function()? purchased,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_PageLoading value) pageLoading,
    required TResult Function(_Error value) error,
    required TResult Function(_Purchased value) purchased,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_PageLoading value)? pageLoading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Purchased value)? purchased,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_PageLoading value)? pageLoading,
    TResult Function(_Error value)? error,
    TResult Function(_Purchased value)? purchased,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends PaymentState {
  const factory _Error(final AppException error) = _$_Error;
  const _Error._() : super._();

  AppException get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PurchasedCopyWith<$Res> {
  factory _$$_PurchasedCopyWith(
          _$_Purchased value, $Res Function(_$_Purchased) then) =
      __$$_PurchasedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PurchasedCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_Purchased>
    implements _$$_PurchasedCopyWith<$Res> {
  __$$_PurchasedCopyWithImpl(
      _$_Purchased _value, $Res Function(_$_Purchased) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Purchased extends _Purchased {
  const _$_Purchased() : super._();

  @override
  String toString() {
    return 'PaymentState.purchased()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Purchased);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentModel payment) product,
    required TResult Function() pageLoading,
    required TResult Function(AppException error) error,
    required TResult Function() purchased,
  }) {
    return purchased();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentModel payment)? product,
    TResult? Function()? pageLoading,
    TResult? Function(AppException error)? error,
    TResult? Function()? purchased,
  }) {
    return purchased?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentModel payment)? product,
    TResult Function()? pageLoading,
    TResult Function(AppException error)? error,
    TResult Function()? purchased,
    required TResult orElse(),
  }) {
    if (purchased != null) {
      return purchased();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_PageLoading value) pageLoading,
    required TResult Function(_Error value) error,
    required TResult Function(_Purchased value) purchased,
  }) {
    return purchased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_PageLoading value)? pageLoading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Purchased value)? purchased,
  }) {
    return purchased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_PageLoading value)? pageLoading,
    TResult Function(_Error value)? error,
    TResult Function(_Purchased value)? purchased,
    required TResult orElse(),
  }) {
    if (purchased != null) {
      return purchased(this);
    }
    return orElse();
  }
}

abstract class _Purchased extends PaymentState {
  const factory _Purchased() = _$_Purchased;
  const _Purchased._() : super._();
}

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProduct,
    required TResult Function(PaymentModel payment) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProduct,
    TResult? Function(PaymentModel payment)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProduct,
    TResult Function(PaymentModel payment)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetProductCopyWith<$Res> {
  factory _$$_GetProductCopyWith(
          _$_GetProduct value, $Res Function(_$_GetProduct) then) =
      __$$_GetProductCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetProductCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$_GetProduct>
    implements _$$_GetProductCopyWith<$Res> {
  __$$_GetProductCopyWithImpl(
      _$_GetProduct _value, $Res Function(_$_GetProduct) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetProduct implements _GetProduct {
  const _$_GetProduct();

  @override
  String toString() {
    return 'PaymentEvent.getProduct()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetProduct);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProduct,
    required TResult Function(PaymentModel payment) send,
  }) {
    return getProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProduct,
    TResult? Function(PaymentModel payment)? send,
  }) {
    return getProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProduct,
    TResult Function(PaymentModel payment)? send,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_Send value) send,
  }) {
    return getProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_Send value)? send,
  }) {
    return getProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(this);
    }
    return orElse();
  }
}

abstract class _GetProduct implements PaymentEvent {
  const factory _GetProduct() = _$_GetProduct;
}

/// @nodoc
abstract class _$$_SendCopyWith<$Res> {
  factory _$$_SendCopyWith(_$_Send value, $Res Function(_$_Send) then) =
      __$$_SendCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentModel payment});

  $PaymentModelCopyWith<$Res> get payment;
}

/// @nodoc
class __$$_SendCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$_Send>
    implements _$$_SendCopyWith<$Res> {
  __$$_SendCopyWithImpl(_$_Send _value, $Res Function(_$_Send) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
  }) {
    return _then(_$_Send(
      null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res> get payment {
    return $PaymentModelCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }
}

/// @nodoc

class _$_Send implements _Send {
  const _$_Send(this.payment);

  @override
  final PaymentModel payment;

  @override
  String toString() {
    return 'PaymentEvent.send(payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Send &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCopyWith<_$_Send> get copyWith =>
      __$$_SendCopyWithImpl<_$_Send>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProduct,
    required TResult Function(PaymentModel payment) send,
  }) {
    return send(payment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProduct,
    TResult? Function(PaymentModel payment)? send,
  }) {
    return send?.call(payment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProduct,
    TResult Function(PaymentModel payment)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(payment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements PaymentEvent {
  const factory _Send(final PaymentModel payment) = _$_Send;

  PaymentModel get payment;
  @JsonKey(ignore: true)
  _$$_SendCopyWith<_$_Send> get copyWith => throw _privateConstructorUsedError;
}
