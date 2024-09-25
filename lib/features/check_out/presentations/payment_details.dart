

import 'package:check_out_app/features/check_out/presentations/widgets/payment_details_body.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: ' Payment Details'),
      body: PaymentDetailsBody(),
    );
  }
}
