import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentIetm extends StatelessWidget {
  const PaymentIetm({super.key, required this.isActive, required this.image});

  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Container(
        width: 100,


        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: isActive ? Colors.green : Colors.grey, width: 2),
        ),
        child: Center(
            child: SvgPicture.asset(
          image,
          height: 24,
              fit: BoxFit.scaleDown,
        )),
      ),
    );
  }
}
