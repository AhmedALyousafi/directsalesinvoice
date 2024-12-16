import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const body = TextStyle(
    fontFamily: 'Readex Pro',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static const amountLarge = TextStyle(
    fontFamily: 'Readex Pro',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const numberKey = TextStyle(
    fontFamily: 'Readex Pro',
    fontSize: 21,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static const bodyLarge = TextStyle(
    fontFamily: 'Readex Pro',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -0.1,
  );

  static const numeric = TextStyle(
    fontFamily: 'Readex Pro',
    fontSize: 21,
    fontWeight: FontWeight.w400,
    height: 0.9,
    letterSpacing: -0.1,
  );
}
