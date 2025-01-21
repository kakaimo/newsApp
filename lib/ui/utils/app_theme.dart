import 'package:flutter/material.dart';
import 'package:news/ui/utils/app_styles.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(centerTitle: true,
    iconTheme:IconThemeData(
      color: AppColors.blackColor
    ) ,
    backgroundColor: AppColors.whiteColor),
    textTheme: TextTheme(
        labelLarge: AppStyles.bold16Black,
        labelMedium: AppStyles.medium14Black,
      headlineLarge: AppStyles.medium20Black
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(centerTitle: true,
        iconTheme:IconThemeData(
            color: AppColors.whiteColor
        ) ,
        backgroundColor: AppColors.blackColor),
    textTheme: TextTheme(
        labelLarge: AppStyles.bold16White,
        labelMedium: AppStyles.medium14White,
        headlineLarge: AppStyles.medium20White,
        headlineMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
          letterSpacing: 1.5,
    ),
    ),
  );
}
