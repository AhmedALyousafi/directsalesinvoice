import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class NumericKeypad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onClear;
  final VoidCallback onBackspace;
  final Function(double) onQuickAmount;

  const NumericKeypad({
    Key? key,
    required this.onNumberPressed,
    required this.onClear,
    required this.onBackspace,
    required this.onQuickAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildNumberRow(['1', '2', '3']),
              _buildNumberRow(['4', '5', '6']),
              _buildNumberRow(['7', '8', '9']),
              _buildNumberRow(['0', '00', '.']),
            ],
          ),
        ),
        SizedBox(
          width: 71,
          child: Column(
            children: [
              _buildControlButton(
                onPressed: onBackspace,
                child: const Icon(Icons.backspace_outlined, size: 19),
              ),
              _buildControlButton(
                onPressed: onClear,
                child: const Icon(
                  Icons.delete,
                  size: 35,
                  color: Colors.red,
                ),
              ),
              _buildEnterButton(),
            ],
          ),
        ),
        SizedBox(
          width: 90,
          child: Column(
            children: [
              _buildQuickAmountButton(1500),
              _buildQuickAmountButton(1000),
              _buildQuickAmountButton(500),
              _buildQuickAmountButton(300),
              _buildQuickAmountButton(100),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumberRow(List<String> numbers) {
    return Row(
      children: numbers.map((number) => _buildNumberButton(number)).toList(),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.neutral),
        ),
        child: TextButton(
          onPressed: () => onNumberPressed(number),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(),
          ),
          child: Text(
            number,
            style: AppTextStyles.numberKey,
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return Container(
      width: 71,
      height: 90.67,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.neutral),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(),
        ),
        child: child,
      ),
    );
  }

  Widget _buildEnterButton() {
    return Container(
      height: 90.67,
      width: 71,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.neutral),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.keyboard_return, size: 21),
          const SizedBox(height: 8),
          Text(
            'Enter',
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAmountButton(double amount) {
    return Container(
      height: 54.4,
      width: 86,
      decoration: BoxDecoration(
        color: AppColors.disabled,
        border: Border.all(color: AppColors.surface),
      ),
      child: TextButton(
        onPressed: () => onQuickAmount(amount),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          amount.toStringAsFixed(0),
          style: AppTextStyles.numberKey,
        ),
      ),
    );
  }
}
