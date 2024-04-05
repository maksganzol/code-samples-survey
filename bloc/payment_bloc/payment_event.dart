part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.getProduct() = _GetProduct;
  const factory PaymentEvent.send(PaymentModel payment) = _Send;
}
