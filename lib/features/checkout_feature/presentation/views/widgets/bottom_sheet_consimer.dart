import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/utils/functions/bottom_sheet_body.dart';
import 'package:payment_app/core/utils/services/api_keys.dart';

import 'package:payment_app/features/checkout_feature/data/models/amount_model/amount_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/amount_model/details.dart';
import 'package:payment_app/features/checkout_feature/data/models/item_list_model/item.dart';
import 'package:payment_app/features/checkout_feature/data/models/item_list_model/item_list_model.dart';

import 'package:payment_app/features/checkout_feature/presentation/views/manager/payment/payment_cubit.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/pay_pal_screen.dart';
import 'package:payment_app/features/thank_you/presentation/views/thank_you_view.dart';

class BottomSheetConsimer extends StatelessWidget {
  const BottomSheetConsimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMsg.toString())));
        }
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
      },
      builder: (context, state) {
        return BottomSheetBody(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //         amount: "200",
            //         currency: "USD",
            //         customerId: "cus_Scnlly6DeTG1jP");
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);

            var getTransactionMethod = getTransaction();

            Navigator.of(context).push(
              payPalScreen(
                  getTransactionMethod.amount, getTransactionMethod.items),
            );
          },
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  ({AmountModel amount, ItemListModel items}) getTransaction() {
    AmountModel amountModel = AmountModel(
        total: '70',
        currency: 'USD',
        details: Details(shipping: "0", subtotal: "70", shippingDiscount: 0));
    ItemListModel itemListModel = ItemListModel(items: [
      Item(name: "Apple", quantity: "4", price: "5", currency: "USD"),
      Item(name: "Pineapple", quantity: "5", price: "10", currency: "USD"),
    ]);

    print(amountModel.toJson());
    print(itemListModel.toJson());

    return (amount: amountModel, items: itemListModel);
  }
}
