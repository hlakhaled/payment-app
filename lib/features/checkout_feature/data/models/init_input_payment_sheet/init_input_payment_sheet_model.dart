class InitInputPaymentSheetModel {
  final String customerEphemeralKeySecret;
  final String customerId;
  final String paymentIntentClientSecret;
  final String merchantDisplayName;

  InitInputPaymentSheetModel(
      {required this.customerEphemeralKeySecret,
      required this.customerId,
      required this.paymentIntentClientSecret,
      required this.merchantDisplayName});
}
