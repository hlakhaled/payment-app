import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/functions/bottom_sheet_body.dart';
import 'package:payment_app/features/checkout_feature/data/repos/check_out_repo_impl.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/manager/payment/payment_cubit.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/bottom_sheet_consimer.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/custom_button.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/custom_order_details_rows.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/custom_total_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/images/cart.png",
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomOrderDetailsRow(
            title: 'Order Subtotal',
            price: '\$42.97',
          ),
          const CustomOrderDetailsRow(
            title: 'Discount',
            price: '\$0',
          ),
          const CustomOrderDetailsRow(
            title: 'Shipping',
            price: '\$8',
          ),
          const Divider(
            height: 28,
            thickness: 2,
            color: Color(0xFFC6C6C6),
          ),
          const CustomTotalText(),
          const SizedBox(
            height: 8,
          ),
          BlocProvider<PaymentCubit>(
            create: (context) => PaymentCubit(checkOutRepo: CheckOutRepoImpl()),
            child: Builder(builder: (context) {
              return CustomButton(
                title: "Complete Payment",
                onTap: () {
                  final paymentCubit = context.read<PaymentCubit>();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BlocProvider.value(
                        value: paymentCubit,
                        child: const BottomSheetConsimer(),
                      );
                    },
                  );
                },
              );
            }),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
