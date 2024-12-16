import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/beneficiary/form_field_widget.dart';

class BeneficiaryForm extends StatelessWidget {
  const BeneficiaryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 572),
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE2E2E2),
                  width: 1,
                ),
              ),
            ),
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: FormFieldWidget(
                        label: 'رقم الجوال',
                        showIcon: false,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormFieldWidget(
                        label: 'اسم المستفيد',
                        showIcon: true,
                        icon: Icons.arrow_drop_down,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft, // الزر على اليسار
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff319626),
                      minimumSize: const Size(70, 36),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // حجم مناسب حسب المحتوى
                      children: const [
                        // مسافة بين الأيقونة والنص
                        Text(
                          'حفظ', // النص
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.save, // الأيقونة
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
