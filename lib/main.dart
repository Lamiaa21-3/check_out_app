import 'package:check_out_app/features/check_out/presentations/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
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


