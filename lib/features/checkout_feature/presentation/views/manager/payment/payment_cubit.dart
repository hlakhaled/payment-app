import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/repos/check_out_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  CheckOutRepo checkOutRepo;
  PaymentCubit({required this.checkOutRepo}) : super(PaymentInitial());
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold((l) => emit(PaymentFailure(errorMsg: l.toString())),
        (r) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
