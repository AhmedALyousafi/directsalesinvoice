import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/cubit/cubit.dart';
import 'package:pos_system/features/pos/presentation/widgets/dashboard_menu/dashboard_menu.dart';
import '../constants/app_colors.dart';

class PaymentMethodButtons extends StatelessWidget {
  const PaymentMethodButtons({
    Key? key,
    required VoidCallback onCardPayment,
    required VoidCallback onCashPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildMethodButton(
          color: Colors.grey,
          icon: Icons.line_weight_sharp,
          onPressed: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => const DashboardMenu()),
            // );
          },
        ),
        _buildMethodButton(
          color: AppColors.secondary,
          icon: Icons.pause_circle,
          onPressed: () {},
        ),
        _buildMethodButton(
          color: const Color(0xFFd2ecfc),
          icon: Icons.settings,
          onPressed: () {
            context.read<InvoiceCubit>().changesettingMultiablePayment();
          },
        ),
        _buildMethodButton(
          color: AppColors.primary,
          icon: Icons.credit_card,
          onPressed: () {},
        ),
        _buildMethodButton(
          color: AppColors.success,
          icon: Icons.money,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMethodButton({
    required Color color,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 55,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.surface),
        onPressed: onPressed,
      ),
    );
  }
}
