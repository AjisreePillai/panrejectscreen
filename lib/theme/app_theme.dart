// THEME LOCK: light — domain signal (consumer finance, mixed signals default to light)
// Scaffold background = AppTheme.background — all screens
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Brand
  static const Color navy = Color(0xFF0B2A5B);
  static const Color orange = Color(0xFFF37021);
  static const Color orangeLight = Color(0xFFFF8A3D);
  static const Color orangeText = Color(0xFFB8470A);
  static const Color borderOrange = Color(0xFFF5A623);

  // Surfaces (light)
  static const Color background = Color(0xFFF6F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color pinkTop = Color(0xFFFCE4EC);
  static const Color pinkBottom = Color(0xFFFFF1F4);
  static const Color yellowCard = Color(0xFFFFF8E1);
  static const Color greyPanel = Color(0xFFEEF0F4);
  static const Color hairline = Color(0xFFE3E6EC);

  // Text / icon tokens (see surface/text pairs)
  static const Color textPrimary = Color(0xFF14213D);
  static const Color textSecondary = Color(0xFF5B6475);
  static const Color textOnStatusBody = Color(0xFF4A5365);
  static const Color textOnNavy = Color(0xFFFFFFFF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textHint = Color(0xFF6B7280);
  static const Color iconInactive = Color(0xFF6B7280);
  static const Color iconOnSearch = Color(0xFF5B6475);

  // Semantic
  static const Color success = Color(0xFF1E8E3E);
  static const Color alert = Color(0xFFC62828);
  static const Color warning = Color(0xFFB8470A);
  static const Color neutral = Color(0xFF5B6475);

  // Dark surfaces (own constants, not reused grey)
  static const Color darkBackground = Color(0xFF0E1627);
  static const Color darkSurface = Color(0xFF16213A);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB4BCCB);

  static TextTheme _textTheme(Brightness b) {
    final base = b == Brightness.light
        ? ThemeData.light().textTheme
        : ThemeData.dark().textTheme;
    final primary = b == Brightness.light ? textPrimary : darkTextPrimary;
    final secondary = b == Brightness.light ? textSecondary : darkTextSecondary;
    final t = GoogleFonts.plusJakartaSansTextTheme(base);
    return t.copyWith(
      headlineSmall: t.headlineSmall?.copyWith(
        color: primary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: t.titleLarge?.copyWith(
        color: primary,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: t.titleMedium?.copyWith(
        color: primary,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: t.bodyLarge?.copyWith(
        color: primary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: t.bodyMedium?.copyWith(
        color: secondary,
        fontSize: 13.5,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: t.bodySmall?.copyWith(
        color: secondary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: t.labelLarge?.copyWith(
        color: primary,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.4,
      ),
    );
  }

  static ThemeData get lightTheme {
    final scheme = ColorScheme.light(
      primary: navy,
      onPrimary: textOnPrimary,
      secondary: orange,
      onSecondary: textOnPrimary,
      surface: surface,
      onSurface: textPrimary,
      error: alert,
      onError: textOnPrimary,
      outline: hairline,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      textTheme: _textTheme(Brightness.light),
      appBarTheme: const AppBarThemeData(
        backgroundColor: navy,
        foregroundColor: textOnNavy,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: hairline),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: surface,
        hintStyle: GoogleFonts.plusJakartaSans(
          color: textHint,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final scheme = ColorScheme.dark(
      primary: orangeLight,
      onPrimary: Color(0xFF000000),
      secondary: orange,
      onSecondary: textOnPrimary,
      surface: darkSurface,
      onSurface: darkTextPrimary,
      error: Color(0xFFFF8A80),
      onError: Color(0xFF000000),
      outline: Color(0xFF2B3A5C),
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: darkBackground,
      textTheme: _textTheme(Brightness.dark),
      appBarTheme: const AppBarThemeData(
        backgroundColor: navy,
        foregroundColor: textOnNavy,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF2B3A5C)),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: surface,
        hintStyle: GoogleFonts.plusJakartaSans(
          color: textHint,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}