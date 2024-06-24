import 'package:flutter/material.dart';
import 'package:test_app/shared/ui/colors/app_colors.dart';
import 'package:test_app/shared/ui/typography/app_text_style.dart';

abstract class AppLightTheme {
  static ThemeData get theme => ThemeData(
        dividerTheme: const DividerThemeData(
          color: AppColors.grey,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: AppColors.neutral,
            unselectedItemColor: AppColors.neutral,
            selectedLabelStyle: AppTextStyle.bodyS,
            type: BottomNavigationBarType.fixed),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(),
        textButtonTheme: const TextButtonThemeData(),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(),
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyle.head1,
          displayMedium: AppTextStyle.head2,
          displaySmall: AppTextStyle.head3,
          titleMedium: AppTextStyle.bodyXL,
          bodyLarge: AppTextStyle.bodyL,
          bodyMedium: AppTextStyle.bodyM,
          bodySmall: AppTextStyle.bodyS,
          labelSmall: AppTextStyle.bodyXS,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.neutral50,
          ),
          contentPadding: const EdgeInsets.only(left: 16),
          fillColor: AppColors.grey,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary)),
          errorStyle: const TextStyle(
            color: AppColors.error,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.neutral),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.neutral25,
            ),
          ),
        ),
      );
}
