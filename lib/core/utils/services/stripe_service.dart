import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/services/api_keys.dart';
import 'package:payment_app/core/utils/services/api_service.dart';
import 'package:payment_app/features/checkout_feature/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/init_input_payment_sheet/init_input_payment_sheet_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentIntentModel> creatPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/payment_intents",
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> creatEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/ephemeral_keys",
      body: {"customer": customerId},
      header: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2022-11-15"
      },
      token: ApiKeys.secretKey,
    );

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  Future initPaymentSheet(
      {required InitInputPaymentSheetModel initInputPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initInputPaymentSheetModel.paymentIntentClientSecret,
        customerId: initInputPaymentSheetModel.customerId,
        customerEphemeralKeySecret:
            initInputPaymentSheetModel.customerEphemeralKeySecret,
        merchantDisplayName: initInputPaymentSheetModel.merchantDisplayName,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var createIntitPayment = await creatPaymentIntent(paymentIntentInputModel);

    var createphemeralKey =
        await creatEphemeralKey(customerId: paymentIntentInputModel.customerId);

    var initInputPaymentSheetModel = InitInputPaymentSheetModel(
        customerEphemeralKeySecret: createphemeralKey.secret!,
        customerId: paymentIntentInputModel.customerId,
        paymentIntentClientSecret: createIntitPayment.clientSecret!,
        merchantDisplayName: "Hla");

    await initPaymentSheet(
        initInputPaymentSheetModel: initInputPaymentSheetModel);

    await displayPaymentSheet();
  }
}
