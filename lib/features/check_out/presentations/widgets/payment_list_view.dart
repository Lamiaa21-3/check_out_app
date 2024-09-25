


import 'package:check_out_app/features/check_out/presentations/widgets/payment_ietm.dart';
import 'package:flutter/material.dart';

class PaymentListView extends StatefulWidget {
  PaymentListView({super.key});

  @override
  State<PaymentListView> createState() => _PaymentListViewState();
}

class _PaymentListViewState extends State<PaymentListView> {
  List<String> paymentList=const[
    'assets/images/card.svg',
    'assets/images/palby.svg'
  ] ;

   int activeIndex=0;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      child: ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: paymentList.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  activeIndex=index;
                  setState(() {

                  });

                },
                  child: PaymentIetm(isActive: activeIndex==index, image: paymentList[index])),
            );
          }),
    );
  }
}