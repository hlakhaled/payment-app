import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/core/utils/services/stripe_service.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/repos/check_out_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
