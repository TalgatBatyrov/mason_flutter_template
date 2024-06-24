import 'package:flutter/material.dart';
import 'package:test_app/shared/ui/typography/app_text_style.dart';

abstract class AppDarkTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.dark(),
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
      );
}
