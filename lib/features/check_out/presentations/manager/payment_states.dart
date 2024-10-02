abstract class PaymentStates{}


class PaymentInitial extends PaymentStates{}
class PaymentLoading extends PaymentStates{}
class PaymentSuccess extends PaymentStates{}
class PaymentFailure extends PaymentStates{

  final String errorMessage;

  PaymentFailure({required this.errorMessage});
}

