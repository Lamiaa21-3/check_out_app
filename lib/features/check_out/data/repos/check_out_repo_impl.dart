import 'package:check_out_app/core/utils/stripe_services.dart';
import 'package:check_out_app/errors/failures.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/check_out/data/repos/check_out_repo.dart';
import 'package:dartz/dartz.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeServices stripeServices = StripeServices();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServices.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      print('eeeeeeeeeeerepoimpl$e');

      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),

      );

    }
  }
}
