import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/cubit/state.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment/pyment_widget.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/payment_screen.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceState());

  changeCalculator(bool? val) {
    emit(state.copyWith(calculator: val));
  }

  changehaedproductgrid(bool? val) {
    emit(state.copyWith(haedproductgrid: val));
  }

  changesettingMultiablePayment() {
    emit(state.copyWith(
        settingMultiablePayment: !state.settingMultiablePayment));
  }

  changesettingplutogridwidget() {
    emit(state.copyWith(plutogridwidget: !state.plutogridwidget));
  }

  void navigateToPaymentWidget(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Paymentwidget(),
      ),
    );
  }
}
