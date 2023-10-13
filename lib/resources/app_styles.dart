import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'app_colors.dart';

class AppStyles {
  AppStyles._();
  static final TextStyle header = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
    fontFamily: Assets.fonts.ralewaySemibold,
    fontSize: 16,
  );
  static final TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: Assets.fonts.ralewayRegular,
    fontSize: 14,
  );
  static final TextStyle body2 = TextStyle(
    color: AppColors.textPlaceHolder,
    fontWeight: FontWeight.w400,
    fontFamily: Assets.fonts.ralewayRegular,
    fontSize: 14,
  );
}
