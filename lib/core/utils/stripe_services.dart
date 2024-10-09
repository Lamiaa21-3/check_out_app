import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_services.dart';
import 'package:check_out_app/features/check_out/data/models/ephemeral_key_model.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/check_out/data/models/payment_intent_input_model.dart';

class StripeServices {
  // create payment intent method
  final ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServices.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    print('mmmmmmmmmmmmmmm${paymentIntentModel.clientSecret}');
    print('llllllllllllllllllllllll${paymentIntentModel.customer}');
    return paymentIntentModel;
  }

  // create init payment  sheet

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
   await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,

          allowsDelayedPaymentMethods: true,
          customFlow: true,


      merchantDisplayName: 'lamiaa',
    ));
  }

// display payment sheet
  Future displayPaymentSheet() async {
   await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,  );
    print('llllllllllllllllllllllll${paymentIntentModel.clientSecret}');
    print('llllllllllllllllllllllll${paymentIntentModel.customer}');
    await displayPaymentSheet();
  }



  //create ephemeral key


  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiServices.post(
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version':'2024-06-20'
      },
      body:{
        'customer':customerId,
      },
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }
}







