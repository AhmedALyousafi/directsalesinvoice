import 'package:flutter/material.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            // الجزء الأيسر
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSummaryCard('إجمالي السعر', Icons.location_on, '0.00',
                        color: Colors.green),
                    _buildSummaryCard('خصم الأصناف', Icons.lock, '0.00'),
                    _buildSummaryCard(
                        'إجمالي الضريبة', Icons.location_on, '0.00'),
                    _buildSummaryCard('خصم ترويجي', Icons.local_offer, '0.00'),
                    _buildSummaryCard(
                        'إجمالي الكمية', Icons.location_on, '0.00'),
                  ],
                ),
              ),
            ),
            // الجزء الأيمن
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSummaryCard('صافي المبلغ', Icons.error, '0.00',
                        color: Colors.red),
                    _buildSummaryCard(
                        'الخصم الترويجي', Icons.local_offer, '0.00'),
                    _buildSummaryCard('المبلغ المتبقي', Icons.lock, '0.00'),
                    _buildSummaryCard('المبلغ المدفوع', Icons.lock, '0.00'),
                    _buildSummaryCard(
                        'المبلغ السابق', Icons.location_on, '0.00'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String label, IconData icon, String value,
      {Color color = Colors.blue}) {
    return SizedBox(
      height: 35, // ضبط ارتفاع ثابت للبطاقة
      child: Card(
        shape: RoundedRectangleBorder(),
        child: Container(
          color: Color(0xffF9F9F9),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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
          ),
        ),
      ),
    );
  }
}
