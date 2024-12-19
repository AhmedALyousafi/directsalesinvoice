import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            // زر الإضافة
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Text(
                '+',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              label: const Text('إضافة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF319626),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // جعل الزوايا مربعة
                ),
              ),
            ),
            const SizedBox(width: 10),
            // حقل الكمية
            _buildQuantityField(),
            const SizedBox(width: 10),
            // حقل الباركود
            Expanded(
              child: _buildBarcodeField(),
            ),
          ],
        ));
  }

  Widget _buildQuantityField() {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        width: 100,
        child: TextField(
          textAlign: TextAlign.right,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: '1 الكمية الإفتراضية',
            hintStyle: TextStyle(
              color: Color(0xFF819AA7),
              fontSize: 12,
              fontFamily: 'Readex Pro',
            ),
          ),
          style: const TextStyle(
            color: Color(0xFF474747),
            fontSize: 14,
            fontFamily: 'Readex Pro',
            fontWeight: FontWeight.bold,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Widget _buildBarcodeField() {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // أيقونة الباركود في المكان المحدد
          const Icon(
            FontAwesomeIcons.barcode,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: 'رقم الباركود',
                  hintStyle: TextStyle(
                    color: Color(0xFF819AA7),
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xFF474747),
                  fontSize: 12,
                  fontFamily: 'Readex Pro',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
