import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panodyssey_core/panodyssey_core.dart';
import 'package:panodyssey_domain/clients/clients.dart';
import 'package:panodyssey_domain/mixins/is_loading_mixin.dart';
import 'package:panodyssey_domain/models/payment_model.dart';

part 'payment_state.dart';
part 'payment_event.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc({
    required InAppPurchaseClient inAppPurchaseClient,
  })  : _inAppPurchaseClient = inAppPurchaseClient,
        super(const PaymentState.pageLoading()) {
    on<_GetProduct>(_onGetProduct);
    on<_Send>(_onSend);
  }

  final InAppPurchaseClient _inAppPurchaseClient;

  Future<void> _onSend(_Send event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.pageLoading());
    final buyResult = await _inAppPurchaseClient.buy(
      event.payment.product,
      event.payment.offer,
    );

    buyResult.fold(
      (error) {
        emit(PaymentState.error(error));
      },
      (isPurchased) {
        if (isPurchased) {
          emit(const PaymentState.purchased());
        }
      },
    );
  }

  Future<void> _onGetProduct(_, Emitter<PaymentState> emit) async {
    emit(const PaymentState.pageLoading());
    final productResult = await _inAppPurchaseClient.getProduct();
    final offerResult = await _inAppPurchaseClient.getOffer();

    emit(
      productResult.fold(PaymentState.error, (product) {
        return offerResult.fold(PaymentState.error, (offer) {
          return PaymentState.product(
            PaymentModel(
              product: product,
              offer: offer,
            ),
          );
        });
      }),
    );
  }

  Future<void> getOffer() async {
    await _inAppPurchaseClient.getOffer();
  }
}
