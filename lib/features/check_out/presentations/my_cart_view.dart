



import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/check_out/presentations/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: ' My Cart'),
      body: MyCartViewBody(),

    );
  }


}
