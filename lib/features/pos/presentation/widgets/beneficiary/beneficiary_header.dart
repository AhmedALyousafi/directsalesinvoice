import 'package:flutter/material.dart';

class BeneficiaryHeader extends StatelessWidget {
  const BeneficiaryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // العودة إلى الشاشة السابقة
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(47),
              ),
              child: const Center(
                child: Text(
                  'X',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF819AA7),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text(
                'بيانات المستفيد',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF474747),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
