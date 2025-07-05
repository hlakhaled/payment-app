import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
