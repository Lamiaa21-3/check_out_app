import 'package:check_out_app/features/check_out/data/repos/check_out_repo.dart';
import 'package:check_out_app/features/check_out/presentations/manager/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/payment_intent_input_model.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (l) => emit(
        PaymentFailure(errorMessage: l.errorMessage,),

      ),
      (r) => emit(
        PaymentSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentStates> change) {
    print(change.toString());
    super.onChange(change);
  }
}
