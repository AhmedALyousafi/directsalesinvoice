import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSummaryCard('إجمالي المبلغ', Icons.location_on, '0.00'),
              _buildSummaryCard('إجمالي الخصم', Icons.location_on, '0.00'),
              _buildSummaryCard('المبلغ النقدي', Icons.location_on, '0.00'),
              _buildSummaryCard(
                  'مبلغ بطاقة الإئتمان', Icons.location_on, '0.00'),
              _buildSummaryCard('استبدال نقدي', Icons.location_on, '0.00'),
              _buildSummaryCard('مبلغ الكوبونات', Icons.location_on, '0.00'),
              _buildSummaryCard(
                'المبلغ المطلوب',
                Icons.location_on,
                '0.00',
                // قيمة باللون الأحمر
              ),
              _buildSummaryCard(
                'المبلغ المدفوع', Icons.location_on,
                '0.00',
                // قيمة باللون الأخضر
              ),
              _buildSummaryCard(
                'المبلغ المتبقي',
                Icons.location_on,
                '0.00',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String label, IconData icon, String value,
      {Color color = Colors.blue}) {
    return Container(
      height: 25, // ارتفاع البطاقة
      margin: const EdgeInsets.symmetric(vertical: 4.0), // مسافة بين البطاقات
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // الحواف الداخلية
      decoration: BoxDecoration(
        // لون الخلفية
        borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
        border: Border.all(color: const Color(0xFFE0E0E0)), // إطار خفيف
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF474747),
              fontFamily: 'ReadexPro',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
