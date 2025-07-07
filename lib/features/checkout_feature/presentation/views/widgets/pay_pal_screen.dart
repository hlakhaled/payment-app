import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/utils/services/api_keys.dart';
import 'package:payment_app/features/checkout_feature/data/models/amount_model/amount_model.dart';

import 'package:payment_app/features/checkout_feature/data/models/item_list_model/item_list_model.dart';

MaterialPageRoute<dynamic> payPalScreen(
    AmountModel amountModel, ItemListModel itemListModel) {
  return MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.clientIdPaypal,
      secretKey: ApiKeys.secretKeyPaypal,
      transactions: [
        {
          "amount": amountModel.toJson(),
          "description": "The payment transaction description.",
          "item_list": itemListModel.toJson()
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        print("onSuccess: $params");
      },
      onError: (error) {
        print("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
      },
    ),
  );
}
