import 'package:flutter/material.dart';

class PaymentMethodButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final double? width;

  const PaymentMethodButton({
    Key? key,
    required this.label,
    required this.icon,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (MediaQuery.of(context).size.width - 80) / 6,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFE2E2E2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF474747),
            ),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 14),
        ],
      ),
    );
  }
}
