import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/constants/app_constants.dart';
import 'package:pos_system/core/theme/app_colors.dart';
import 'package:pos_system/core/widgets/app_button.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/cubit/state.dart';
import 'package:pos_system/features/pos/presentation/widgets/beneficiary/beneficiary_page.dart';
import 'package:pos_system/features/pos/presentation/widgets/dashboard_menu/dashboard_menu.dart';
import 'package:pos_system/features/pos/presentation/widgets/payment_module/payment_screen.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<InvoiceCubit>(context);

        // إذا كانت الحالة "calculator" صحيحة، يتم عرض صفحة الدفع فقط.
        if (state.calculator) {
          return SizedBox(width: 332, height: 750, child: PaymentScreen());
        }

        // إذا كانت الحالة "calculator" غير صحيحة، يتم عرض باقي محتويات الـ SidePanel.
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            width: AppConstants.sidePanelWidth,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius:
                  BorderRadius.circular(AppConstants.defaultBorderRadius),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultSpacing),
                  child: Row(
                    children: [
                      AppButton(
                        onPressed: () {
                          cubit.changehaedproductgrid(!state.haedproductgrid);
                        },
                        color: AppColors.success,
                        width: 35,
                        height: 40,
                        child: const Icon(
                          Icons.arrow_right_alt_sharp,
                          color: AppColors.surface,
                        ),
                      ),
                      const SizedBox(width: AppConstants.defaultSpacing),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: AppButton(
                            onPressed: () {
                              // تبديل حالة calculator
                              cubit.changeCalculator(!state.calculator);
                            },
                            color: AppColors.border,
                            width: 35,
                            height: 40,
                            child: const Icon(
                              Icons.settings_ethernet_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(AppConstants.defaultSpacing),
                    children: [
                      _buildAmountCard(
                        context,
                        'المبلغ المطلوب',
                        '0.00',
                        AppColors.error,
                        AppColors.error.withOpacity(0.1),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      _buildAmountCard(
                        context,
                        'المبلغ النقدي',
                        '0.00',
                        AppColors.disabled,
                        AppColors.background,
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      _buildAmountCard(
                        context,
                        'مبلغ البطاقة',
                        '0.00',
                        AppColors.disabled,
                        AppColors.background,
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      _buildAmountCard(
                        context,
                        'المبلغ المتبقي',
                        '0.00',
                        AppColors.success,
                        AppColors.success.withOpacity(0.1),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0.5),
                Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultSpacing),
                  child: Column(
                    children: [
                      AppButton(
                        onPressed: () {},
                        color: AppColors.success,
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.payments_outlined,
                          color: AppColors.surface,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {},
                        color: AppColors.primary,
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.payment_outlined,
                          color: AppColors.surface,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {
                          context
                              .read<InvoiceCubit>()
                              .changesettingMultiablePayment();
                        },
                        color: const Color.fromARGB(255, 141, 185, 227),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.settings,
                          color: Color(0xFF0C69C0),
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {},
                        color: AppColors.warning,
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.pause_circle,
                          color: AppColors.surface,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () => _showBeneficiaryDialog(context),
                        color: Color(0xFFF2F2F2),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.line_weight_sharp,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () => _showBeneficiaryScreen(context),
                        color: Color.fromARGB(255, 141, 185, 227),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.person_sharp,
                          color: Color(0xFF0C69C0),
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {},
                        color: Colors.red[50],
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.percent,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmountCard(
    BuildContext context,
    String title,
    String amount,
    Color textColor,
    Color backgroundColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultSpacing),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            amount,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  void _showBeneficiaryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: DashboardMenu(context),
      ),
    );
  }

  void _showBeneficiaryScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(),
      builder: (context) => const BeneficiaryPage(),
    );
  }
}
