import 'package:flutter/material.dart';

class CustomTextStyle extends TextStyle {
  static const TextStyle b24 = TextStyle(fontFamily: Nunito.b, fontSize: 24);

  // Material Design Text Styles
  static const TextStyle displayLarge =
      TextStyle(fontFamily: Nunito.r, fontSize: 57);
  static const TextStyle displayMedium =
      TextStyle(fontFamily: Nunito.r, fontSize: 45);
  static const TextStyle displaySmall =
      TextStyle(fontFamily: Nunito.r, fontSize: 36);
  static const TextStyle headlineLarge =
      TextStyle(fontFamily: Nunito.r, fontSize: 32);
  static const TextStyle headlineMedium =
      TextStyle(fontFamily: Nunito.r, fontSize: 28);
  static const TextStyle headlineSmall =
      TextStyle(fontFamily: Nunito.r, fontSize: 24);
  static const TextStyle titleLarge =
      TextStyle(fontFamily: Nunito.b, fontSize: 22);
  static const TextStyle titleMedium =
      TextStyle(fontFamily: Nunito.b, fontSize: 18);
  static const TextStyle titleSmall =
      TextStyle(fontFamily: Nunito.b, fontSize: 16);
  static const TextStyle labelLarge =
      TextStyle(fontFamily: Nunito.m, fontSize: 14);
  static const TextStyle labelMedium =
      TextStyle(fontFamily: Nunito.m, fontSize: 12);
  static const TextStyle labelSmall =
      TextStyle(fontFamily: Nunito.m, fontSize: 11);
  static const TextStyle bodyLarge =
      TextStyle(fontFamily: Nunito.r, fontSize: 16);
  static const TextStyle bodyMedium =
      TextStyle(fontFamily: Nunito.r, fontSize: 14);
  static const TextStyle bodySmall =
      TextStyle(fontFamily: Nunito.r, fontSize: 12);
}

class Nunito {
  /// Nunito-Light 300
  static const String l = 'Nunito-L';

  /// Nunito-Regular 400
  static const String r = 'Nunito-R';

  /// Nunito-Medium 500
  static const String m = 'Nunito-M';

  /// Nunito-SemiBold 600
  static const String sb = 'Nunito-SB';

  /// Nunito-Bold 700
  static const String b = 'Nunito-B';

  /// Nunito-ExtraBold 800
  static const String xb = 'Nunito-XB';
}
