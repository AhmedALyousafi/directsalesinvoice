import 'package:flutter/material.dart';
import 'package:pos_system/features/pos/presentation/widgets/beneficiary/beneficiary_page.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class BeneficiaryActions extends StatelessWidget {
  final VoidCallback? onBeneficiaryDiscount;

  const BeneficiaryActions({
    Key? key,
    this.onBeneficiaryDiscount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              title: 'خصم المستفيد',
              backgroundColor: AppColors.error100,
              iconBackgroundColor: AppColors.error50,
              icon: Icons.remove_circle_outline,
              onPressed: onBeneficiaryDiscount,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildActionButton(
              title: 'بيانات المستفيد',
              backgroundColor: AppColors.info100,
              iconBackgroundColor: AppColors.info50,
              icon: Icons.person_outline,
              onPressed: () => _showBeneficiaryScreen(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required Color backgroundColor,
    required Color iconBackgroundColor,
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 47,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 35,
                height: 31,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBeneficiaryScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const BeneficiaryPage(),
    );
  }
}
