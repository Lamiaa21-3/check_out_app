import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_services.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_model/payment_intent_model.dart';

import '../../features/check_out/data/models/payment_intent_input_model.dart';

class StripeServices {
  final ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
      var response= await  apiServices.post(body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey,
        );
     var  paymentIntentModel=PaymentIntentModel.fromJson(response.data);
     return paymentIntentModel;
  }
}
