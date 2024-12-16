import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: 700,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE2E2E2)),
                      ),
                    ),
                    child: const Text(
                      'سعر التحويل',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF819AA7),
                        fontSize: 12,
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE2E2E2)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        SizedBox(width: 10),
                        Text(
                          'العملة',
                          style: TextStyle(
                            color: Color(0xFF819AA7),
                            fontSize: 12,
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 11),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 8),
                Text(
                  'طرق الدفع',
                  style: TextStyle(
                    color: Color(0xFF474747),
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
          // الأزرار مع النصوص والأيقونات في صف واحد
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                PaymentMethodButton(
                  label: 'كوبونات',
                  icon: Icons.card_giftcard,
                  width: 90,
                ),
                SizedBox(width: 5),
                PaymentMethodButton(
                  label: 'نقاطي',
                  icon: Icons.stars,
                  width: 90,
                ),
                SizedBox(width: 5),
                PaymentMethodButton(
                  icon: Icons.swap_horiz,
                  label: 'استبدال',
                  width: 90,
                ),
                SizedBox(width: 5),
                PaymentMethodButton(
                  label: 'آجل',
                  icon: Icons.access_time,
                  width: 80,
                ),
                SizedBox(width: 5),
                PaymentMethodButton(
                  label: 'بطائق الائتمان',
                  icon: Icons.credit_card,
                  width: 112,
                ),
                SizedBox(width: 5),
                PaymentMethodButton(
                  label: 'نقدي',
                  icon: Icons.attach_money,
                  width: 75,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// مكون الزر مع الأيقونة والعنوان بجانب بعضهما
class PaymentMethodButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final double width;

  const PaymentMethodButton({
    Key? key,
    required this.label,
    required this.icon,
    this.width = 80, // عرض افتراضي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF474747),
            ),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 18, color: const Color(0xFF474747)),
        ],
      ),
    );
  }
}
