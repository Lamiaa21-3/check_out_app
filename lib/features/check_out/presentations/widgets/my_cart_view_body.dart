import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/check_out/presentations/payment_details.dart';
import 'package:check_out_app/features/check_out/presentations/widgets/payment_method_bottom_sheet.dart';
import 'package:check_out_app/features/check_out/presentations/widgets/total_price_ietm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import 'order_info_ietm.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/basket_image.png'),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoIetm(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoIetm(
            title: 'Discount',
            value: r'$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoIetm(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPriceIetm(
            title: 'Total',
            value: r'$44:87',
          ),
          SizedBox(
            height: 18,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return PaymentDetailsView();
              // }));
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return PaymentMethodsBottomSheet();

                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
