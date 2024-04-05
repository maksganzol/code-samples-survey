part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState, IsLoadingMixin {
  const PaymentState._();

  const factory PaymentState.product(
    PaymentModel payment,
  ) = _Product;

  const factory PaymentState.pageLoading() = _PageLoading;

  const factory PaymentState.error(AppException error) = _Error;

  const factory PaymentState.purchased() = _Purchased;

  @override
  bool get isLoading => this is _PageLoading;
}
