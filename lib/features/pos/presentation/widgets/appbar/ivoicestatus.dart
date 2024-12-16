import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/appbar/customtoolbar.dart';

class InvoiceStatus extends StatefulWidget {
  const InvoiceStatus({super.key});

  @override
  State<InvoiceStatus> createState() => _InvoiceStatusState();
}

class _InvoiceStatusState extends State<InvoiceStatus> {
  bool _showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Icon(
                    Icons.folder_open,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'لوحة التحكم',
                    style: TextStyle(
                      color: Color(0xFF819AA7),
                      fontSize: 12,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '|',
                    style: TextStyle(
                      color: Color(0xFFE2E2E2),
                      fontSize: 14,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildInvoiceChip(
                    color: Colors.white,
                    text: 'فاتورة - 342',
                    backgroundColor: const Color(0xFF0C69C0),
                  ),
                  const SizedBox(width: 8),
                  _buildInvoiceChip(
                    text: 'فاتورة معلقة - 22',
                    color: const Color(0xFFF69B42),
                    backgroundColor: const Color(0xFFFEFAF5),
                  ),
                  const Spacer(),
                  _buildInvoiceChip(
                    text: 'قارئ الأسعار',
                    color: Colors.white,
                    backgroundColor: const Color(0xFF0C69C0),
                  ),
                  const SizedBox(width: 8),
                  _buildInvoiceChip2(
                    text: '30 سبتمبر 2024',
                    color: Color(0xFF4B4B4B),
                    backgroundColor: const Color(0xFFF4F4F4),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDropdown = !_showDropdown;
                      });
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFF4B4B4B),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            if (_showDropdown)
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: CustomToolBar(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceChip({
    required String text,
    required Color color,
    required Color backgroundColor,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: backgroundColor == const Color(0xFFFEFAF5)
              ? Border.all(color: const Color(0xFFF4E4CF))
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 17,
              height: 17,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor == const Color(0xFFFEFAF5)
                    ? const Color(0xFFF69B42)
                    : const Color(0xFFEBF8FF),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                'X',
                style: TextStyle(
                  color: backgroundColor == const Color(0xFFFEFAF5)
                      ? const Color(0xFFFEFAF5)
                      : const Color(0xFF0C69C0),
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceChip2({
    required String text,
    required Color color,
    required Color backgroundColor,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: backgroundColor == const Color(0xFFFEFAF5)
              ? Border.all(color: const Color(0xFFF4E4CF))
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 17,
              height: 17,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor == const Color(0xFFFEFAF5)
                    ? const Color(0xFFF69B42)
                    : const Color(0xFFEBF8FF),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(
                Icons.calendar_month_outlined,
                color: Color(0xff819AA7),
                size: 16,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
