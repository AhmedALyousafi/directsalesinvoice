import 'package:flutter/material.dart';

class PaymentActions extends StatelessWidget {
  const PaymentActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 16),
      Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFE2E2E2)),
          ),
        ),
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: const [
            Expanded(
                child: ActionButton(label: 'نموذج الطباعة', icon: Icons.print)),
            SizedBox(width: 16),
            Expanded(
                child: ActionButton(label: 'اسم الاتصال', icon: Icons.person)),
          ],
        ),
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('حفظ'),
            icon: const Icon(Icons.save),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: const Size(70, 31),
            ),
          ),
        ],
      ),
    ]);
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ActionButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF474747),
            ),
          ),
          const SizedBox(width: 4),
          // وضع الأيقونة في الجهة اليمنى
          Icon(icon, size: 18, color: const Color(0xFF474747)),
        ],
      ),
    );
  }
}
