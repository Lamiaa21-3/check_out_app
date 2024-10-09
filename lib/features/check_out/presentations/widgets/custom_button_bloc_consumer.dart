import 'dart:developer';

import 'package:check_out_app/features/check_out/presentations/manager/payment_cubit.dart';
import 'package:check_out_app/features/check_out/presentations/manager/payment_states.dart';
import 'package:check_out_app/features/check_out/presentations/think_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      builder: (BuildContext context, state) {
        return CustomButton(
          onTap: () {

            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: "YOUR CLIENT ID",
                secretKey: "YOUR SECRET KEY",
                transactions: const [
                  {
                    "amount": {
                      "total": '100',
                      "currency": "USD",
                      "details": {
                        "subtotal": '100',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '10',
                          "currency": "USD"
                        },
                        {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '12',
                          "currency": "USD"
                        }
                      ],

                      // Optional
                      //   "shipping_address": {
                      //     "recipient_name": "Tharwat samy",
                      //     "line1": "tharwat",
                      //     "line2": "",
                      //     "city": "tharwat",
                      //     "country_code": "EG",
                      //     "postal_code": "25025",
                      //     "phone": "+00000000",
                      //     "state": "ALex"
                      //  },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
          //   PaymentIntentInputModel paymentIntentInputModel =
          //       PaymentIntentInputModel(
          //     amount: '100',
          //     currency: 'usd',
          //     customerId: 'cus_Qza8RUJaKVHwCH',
          //   );
          //   BlocProvider.of<PaymentCubit>(context)
          //       .makePayment(paymentIntentInputModel: paymentIntentInputModel);
           },
          text: 'Continues',
          isLoading: state is PaymentLoading ? true : false,
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ThinkYouView()));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print(state.errorMessage);
        }
      },
    );
  }
}
