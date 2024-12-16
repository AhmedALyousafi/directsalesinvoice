import 'package:flutter/material.dart';
import 'menu_item.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    icon: Icons.currency_exchange,
                    label: 'تبديل العملة',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.receipt_long,
                    label: 'إسترجاع الفاتورة',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.swap_horiz,
                    label: 'استبدال',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    icon: Icons.point_of_sale,
                    label: 'فتح درج',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.receipt_long,
                    label: 'طباعة فواتير سابقة',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.receipt,
                    label: 'طباعة اخر فاتورة',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    icon: Icons.info_outline,
                    label: "تفاصيل",
                    onPressed: () {},
                  ),
                  SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.description_outlined,
                    label: "نموذج الرسمي لتجميع الاصناف المكررة",
                    onPressed: () {},
                  ),
                  SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.article_outlined,
                    label: "نموذج مصغر لتجميع الاصناف المكررة",
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    icon: Icons.lock_outline,
                    label: "قفل الشاشة",
                    onPressed: () {},
                  ),
                  const SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.switch_account_outlined,
                    label: "تغيير المستخدم",
                    onPressed: () {},
                  ),
                  const SizedBox(width: 6),
                  ActionButton(
                    icon: Icons.settings_outlined,
                    label: "إعدادات المستخدم",
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
