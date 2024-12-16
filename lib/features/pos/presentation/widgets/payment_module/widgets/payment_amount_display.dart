import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/cubit/state.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PaymentAmountDisplay extends StatelessWidget {
  final double requiredAmount;
  final double cardAmount;
  final double cashAmount;
  final double remainingAmount;

  const PaymentAmountDisplay({
    Key? key,
    required this.requiredAmount,
    required this.cardAmount,
    required this.cashAmount,
    required this.remainingAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildRequiredAmount(),
            const SizedBox(height: 8),
            _buildPaymentMethods(),
            const SizedBox(height: 8),
            _buildRemainingAmount(),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<InvoiceCubit>(context);
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              // border: Border(
              //   bottom: BorderSide(color: AppColors.border),
              // ),
              ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppButton(
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
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      height: 50,
                      width: 250,
                      onPressed: () {
                        cubit.changeCalculator(!state.calculator);
                      },
                      color: AppColors.surface,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تصغير الاجمالي',
                            style: AppTextStyles.body,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(FontAwesomeIcons.downLeftAndUpRightToCenter),
                          SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRequiredAmount() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: const BoxDecoration(
        color: AppColors.error100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Row(
        children: [
          Text(
            requiredAmount.toStringAsFixed(2),
            style: AppTextStyles.amountLarge.copyWith(
              color: AppColors.error,
            ),
          ),
          const Spacer(),
          const Text(
            'المبلغ المطلوب',
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Row(
      children: [
        _buildPaymentMethodAmount(
          label: 'مبلغ البطاقة',
          amount: cardAmount,
        ),
        const SizedBox(width: 8),
        _buildPaymentMethodAmount(
          label: 'المبلغ النقدي',
          amount: cashAmount,
        ),
      ],
    );
  }

  Widget _buildPaymentMethodAmount({
    required String label,
    required double amount,
  }) {
    return Expanded(
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.disabled,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        child: Row(
          children: [
            Text(
              amount.toStringAsFixed(2),
              style: AppTextStyles.amountLarge.copyWith(
                color: AppColors.disabledText,
              ),
            ),
            const Spacer(),
            Text(
              label,
              style: AppTextStyles.body,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemainingAmount() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: const BoxDecoration(
        color: AppColors.success100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Row(
        children: [
          Text(
            remainingAmount.toStringAsFixed(2),
            style: AppTextStyles.amountLarge.copyWith(
              color: AppColors.success,
            ),
          ),
          const Spacer(),
          const Text(
            'المبلغ المتبقي',
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }
}
