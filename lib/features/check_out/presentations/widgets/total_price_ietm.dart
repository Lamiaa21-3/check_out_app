


import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class TotalPriceIetm extends StatelessWidget {
  const TotalPriceIetm({
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
          style: Styles.style24,
        ),
        Spacer(),
        Text(
          value,
          style: Styles.style24,
        ),
      ],
    );
  }
}