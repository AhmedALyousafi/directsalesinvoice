import 'package:flutter/material.dart';
import 'form_input_field.dart';

class AddBeneficiaryForm extends StatefulWidget {
  const AddBeneficiaryForm({super.key});

  @override
  State<AddBeneficiaryForm> createState() => _AddBeneficiaryFormState();
}

class _AddBeneficiaryFormState extends State<AddBeneficiaryForm> {
  bool isExpanded = false; // حالة للتحكم في إظهار أو إخفاء العناصر

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 572),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFFF2F2F2),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      isExpanded
                          ? Icons.arrow_drop_up // تغيير الأيقونة عند التوسعة
                          : Icons.arrow_drop_down,
                      size: 18,
                      color: const Color(0xFF474747),
                    ),
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded; // تبديل الحالة
                      });
                    },
                  ),
                  const SizedBox(width: 410),
                  const Text(
                    'إضافة مستفيد جديد',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF474747),
                    ),
                  ),
                ],
              ),
            ),
            if (isExpanded) // عرض الـ Column فقط عندما تكون الحالة true
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE2E2E2)),
                  ),
                ),
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: FormInputField(
                            label: 'رقم الجوال',
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: FormInputField(
                            label: 'اسم المستفيد',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Expanded(
                          child: FormInputField(
                            label: 'الوحدة المالية',
                            hasDropdown: true,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: FormInputField(
                            label: 'الاسم الاجنبي',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Expanded(
                          child: FormInputField(
                            label: 'رقم الحساب',
                            hasDropdown: true,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: FormInputField(
                            label: 'رقم المجموعة',
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
                          backgroundColor: const Color(0xff0C69C0),
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
                          mainAxisSize:
                              MainAxisSize.min, // حجم مناسب حسب المحتوى
                          children: const [
                            // مسافة بين الأيقونة والنص
                            Text(
                              'اضافة', // النص
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
      ),
    );
  }
}
