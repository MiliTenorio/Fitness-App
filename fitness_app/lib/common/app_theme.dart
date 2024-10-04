import 'package:fitness_app/common/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainBlueMenu,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.justWhite,
        fontWeight: FontWeight.w900,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundGrey,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 12),
        ),
      ),
    ),
  );
}
