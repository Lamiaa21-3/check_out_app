import 'dart:developer';

import 'package:check_out_app/features/check_out/data/models/amount_model/amount_model.dart';
import 'package:check_out_app/features/check_out/data/models/amount_model/details.dart';
import 'package:check_out_app/features/check_out/data/models/item_list_model/item.dart';
import 'package:check_out_app/features/check_out/data/models/item_list_model/item_list_model.dart';
import 'package:check_out_app/features/check_out/presentations/manager/payment_cubit.dart';
import 'package:check_out_app/features/check_out/presentations/manager/payment_states.dart';
import 'package:check_out_app/features/check_out/presentations/think_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../core/widgets/custom_button.dart';


class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      builder: (BuildContext context, state) {
        return CustomButton(
          onTap: () {
            var amount = AmountModel(
                total: "100",
                currency: "USD",
                details: Details(
                  shipping: "0",
                  shippingDiscount: 0,
                  subtotal: "100",
                ));
         List<OrderItemModel> orders=[
           OrderItemModel(
             currency: "USD",
             name:"Apple",
             price: "4",
             quantity: 10,
           ),
           OrderItemModel(
             currency: "USD",
             name:"Apple",
             price: "5",
             quantity: 12,
           ),

         ];
         var itemList=ItemListModel(orders: orders);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: "YOUR CLIENT ID",
                secretKey: "YOUR SECRET KEY",
                transactions:  [
                  {
                    "amount": amount.toJson(),
                    "description": "The payment transaction description.",

                    "item_list":itemList.toJson(),
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
