import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/functions/bottom_sheet_body.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/manager/payment/payment_cubit.dart';
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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                    amount: "200",
                    currency: "USD",
                    customerId: "cus_Scnlly6DeTG1jP");
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
