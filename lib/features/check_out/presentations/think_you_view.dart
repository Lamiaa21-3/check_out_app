import 'package:check_out_app/features/check_out/presentations/widgets/think_you_body.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class ThinkYouView extends StatelessWidget {
  const ThinkYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(


      appBar: buildAppBar(context: context),
      body: Transform.translate(offset: Offset(0, -16),
      child: ThinkYouBody()),
    );
  }
}


