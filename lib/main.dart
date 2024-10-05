import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/features/check_out/presentations/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
   debugShowCheckedModeBanner: false,
      home: MyCartView(),


    );
  }
}


