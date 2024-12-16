import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/widgets/beneficiary_actions.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/widgets/numeric_keypad.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/widgets/payment_amount_display.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/widgets/payment_method_buttons.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double requiredAmount = 0.0;
  double cardAmount = 0.0;
  double cashAmount = 0.0;
  double remainingAmount = 0.0;

  void updateAmount(String value) {
    setState(() {
      if (value == '.') {
        if (!requiredAmount.toString().contains('.')) {
          requiredAmount = double.parse('${requiredAmount.toString()}.');
        }
        return;
      }

      if (value == '00') {
        requiredAmount = requiredAmount * 100;
      } else {
        double newValue = double.parse(value);
        if (requiredAmount == 0) {
          requiredAmount = newValue;
        } else {
          requiredAmount = double.parse('${requiredAmount.toString()}$value');
        }
      }

      calculateRemainingAmount();
    });
  }

  void clearAmount() {
    setState(() {
      requiredAmount = 0.0;
      calculateRemainingAmount();
    });
  }

  void backspace() {
    setState(() {
      String currentAmount = requiredAmount.toString();
      if (currentAmount.length > 1) {
        requiredAmount =
            double.parse(currentAmount.substring(0, currentAmount.length - 1));
      } else {
        requiredAmount = 0.0;
      }
      calculateRemainingAmount();
    });
  }

  void calculateRemainingAmount() {
    setState(() {
      remainingAmount = requiredAmount - (cardAmount + cashAmount);
    });
  }

  void setQuickAmount(double amount) {
    setState(() {
      requiredAmount = amount;
      calculateRemainingAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332,
      height: 600.68,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                PaymentAmountDisplay(
                  requiredAmount: requiredAmount,
                  cardAmount: cardAmount,
                  cashAmount: cashAmount,
                  remainingAmount: remainingAmount,
                ),
                SizedBox(height: 16),
                PaymentMethodButtons(
                  onCardPayment: () {
                    setState(() {
                      cardAmount = requiredAmount;
                      calculateRemainingAmount();
                    });
                  },
                  onCashPayment: () {
                    setState(() {
                      cashAmount = requiredAmount;
                      calculateRemainingAmount();
                    });
                  },
                ),
                SizedBox(height: 16),
                NumericKeypad(
                  onNumberPressed: updateAmount,
                  onClear: clearAmount,
                  onBackspace: backspace,
                  onQuickAmount: setQuickAmount,
                ),
                const BeneficiaryActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
