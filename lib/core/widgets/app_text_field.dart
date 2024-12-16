import 'package:flutter/material.dart';
import 'package:pos_system/core/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final InputBorder? border;

  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.textDirection,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.isDense,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textDirection: textDirection,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        isDense: isDense,
        border: border,
      ),
    );
  }
}
