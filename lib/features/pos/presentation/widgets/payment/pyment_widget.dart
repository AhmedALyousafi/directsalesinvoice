import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment/widgets/payment_actions.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment/widgets/payment_header.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment/widgets/payment_methods.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment/widgets/payment_summary.dart';

class Paymentwidget extends StatelessWidget {
  const Paymentwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF9F9F9),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(96, 96, 96, 0.25),
              blurRadius: 4,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Expanded(
            child: Column(
              children: [
                PaymentHeader(),
                SizedBox(height: 22),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ensure PaymentSummary has a defined size
                      SizedBox(
                        width: 300, // Define a width for the PaymentSummary
                        child: PaymentSummary(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            // Ensure PaymentMethods has a defined size
                            PaymentMethods(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PaymentActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
