part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String errorMsg;
  PaymentFailure({required this.errorMsg});
}

final class PaymentSuccess extends PaymentState {}

final class PaymentLoading extends PaymentState {}
