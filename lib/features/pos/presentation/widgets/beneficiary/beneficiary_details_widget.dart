import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/beneficiary/add_beneficiary_form.dart';
import 'beneficiary_form.dart';
import 'beneficiary_header.dart';

class BeneficiaryDetailsWidget extends StatelessWidget {
  const BeneficiaryDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 604),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: const Color(0xFFF9F9F9),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF9E9E9E),
            blurRadius: 6,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          BeneficiaryHeader(),
          BeneficiaryForm(),
          SizedBox(height: 18),
          AddBeneficiaryForm(),
        ],
      ),
    );
  }
}
