import 'package:ecyzhi_flutter/config/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.cyan,
    textTheme: textTheme,
    cardColor: Colors.grey[200]!,
    scaffoldBackgroundColor: const Color.fromARGB(255, 246, 252, 253),
  );

  static final ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.cyan,
    textTheme: textTheme,
    cardColor: Colors.grey[850]!,
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: CustomTextStyle.displayLarge,
    displayMedium: CustomTextStyle.displayMedium,
    displaySmall: CustomTextStyle.displaySmall,
    headlineLarge: CustomTextStyle.headlineLarge,
    headlineMedium: CustomTextStyle.headlineMedium,
    headlineSmall: CustomTextStyle.headlineSmall,
    titleLarge: CustomTextStyle.titleLarge,
    titleMedium: CustomTextStyle.titleMedium,
    titleSmall: CustomTextStyle.titleSmall,
    labelLarge: CustomTextStyle.labelLarge,
    labelMedium: CustomTextStyle.labelMedium,
    labelSmall: CustomTextStyle.labelSmall,
    bodyLarge: CustomTextStyle.bodyLarge,
    bodyMedium: CustomTextStyle.bodyMedium,
    bodySmall: CustomTextStyle.bodySmall,
  );
}
