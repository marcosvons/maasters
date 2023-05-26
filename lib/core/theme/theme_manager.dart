import 'package:flutter/material.dart';

const inter = 'Inter';

class ThemeManager {
  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xFFE3E6EA),
      cursorColor: Color(0xff383838),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: Color(0xff383838),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: const Color(0xff2B1C9A),
      // ignore: avoid_redundant_argument_values
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: const Color(0xff05051B),
      surface: const Color(0xff0A243F),
      surfaceVariant: const Color(0xFF05051B).withOpacity(0.65),
      surfaceTint: const Color(0xFF6B7B8A),
      tertiary: const Color(0xFF412EF2),
      tertiaryContainer: const Color(0xFFFAFAFA),
      onTertiary: const Color(0xFFE3E6EA),
      onTertiaryContainer: const Color(0xFF6B7B8A),
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(),
      displayLarge: TextStyle(
        fontSize: 32,
        color: Color(0xff0A243F),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
        letterSpacing: 1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        color: Color(0xff0A243F),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
        letterSpacing: 1.5,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xff0A243F),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
        fontFamily: inter,
      ),
      titleMedium: TextStyle(
        fontSize: 12,
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
        fontFamily: inter,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
        fontFamily: inter,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xff05051B),
        fontWeight: FontWeight.w400,
        fontFamily: inter,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Color(0xff05051B),
        fontWeight: FontWeight.w400,
        fontFamily: inter,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Color(0xff05051B),
        fontWeight: FontWeight.w400,
        fontFamily: inter,
      ),
    ),
  );
}
