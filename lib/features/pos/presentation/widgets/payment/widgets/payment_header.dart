import 'package:flutter/material.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Container(
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
                  color: Color(0xFF819AA7),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          onPressed: () {
            () => Navigator.of(context).pop();
          },
        ),
        const Expanded(
          child: Text(
            'دفع متعدد',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF474747),
            ),
          ),
        ),
      ],
    );
  }
}
