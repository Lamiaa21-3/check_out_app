import 'package:check_out_app/features/check_out/presentations/manager/payment_cubit.dart';
import 'package:check_out_app/features/check_out/presentations/manager/payment_states.dart';
import 'package:check_out_app/features/check_out/presentations/think_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit,PaymentStates>(
      builder: (BuildContext context, state) {
        return CustomButton(
          text: 'Continues',
          isLoading: state is PaymentLoading ? true : false,
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ThinkYouView()));
        }
        if(state is PaymentFailure)
          {
            SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
      },
    );
  }
}
