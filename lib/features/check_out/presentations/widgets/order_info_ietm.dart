

import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class OrderInfoIetm extends StatelessWidget {
  const OrderInfoIetm({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        Spacer(),
        Text(
          value,
          style: Styles.style18,
        ),
      ],
    );
  }
}