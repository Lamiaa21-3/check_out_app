import 'package:check_out_app/core/widgets/custom_button.dart';
import 'package:check_out_app/features/check_out/presentations/think_you_view.dart';
import 'package:check_out_app/features/check_out/presentations/widgets/custom_credit_card.dart';

import 'package:check_out_app/features/check_out/presentations/widgets/payment_list_view.dart';
import 'package:flutter/material.dart';


class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey= GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentListView()),
        SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey, autovalidateMode: autovalidateMode,),),
         SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16,bottom: 8),
                child: CustomButton(text: 'Payment',onTap: (){
                  if(formKey.currentState!.validate())
                    {
                     formKey.currentState?.save();

                    }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ThinkYouView();
                    }));
                    autovalidateMode=AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },),
              )),),
      ],
    );
  }
}
