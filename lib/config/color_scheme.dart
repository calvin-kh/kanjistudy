import 'package:flutter/material.dart';

/// KanjiStudy Color Tokens
///
/// Teal 기반 컬러 시스템. nihongo-app(Indigo)과 차별화.
abstract final class AppColors {
  // ─── Brand / Primary ───
  static const Color primary = Color(0xFF0D9488);       // Teal
  static const Color secondary = Color(0xFF8B5CF6);     // Violet
  static const Color accent = Color(0xFFF59E0B);        // Amber

  // ─── Semantic ───
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // ─── Text (Light) ───
  static const Color textPrimary = Color(0xFF1E293B);   // Slate 800
  static const Color textSecondary = Color(0xFF64748B); // Slate 500
  static const Color textMuted = Color(0xFF94A3B8);     // Slate 400
  static const Color textOnPrimary = Colors.white;

  // ─── Text (Dark) ───
  static const Color darkTextPrimary = Color(0xFFF1F5F9);  // Slate 100
  static const Color darkTextSecondary = Color(0xFF94A3B8); // Slate 400

  // ─── Surface (Light) ───
  static const Color background = Color(0xFFF8FAFC);    // Slate 50
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF1F5F9); // Slate 100
  static const Color border = Color(0xFFE2E8F0);        // Slate 200
  static const Color borderFocused = primary;
  static const Color divider = Color(0xFFF1F5F9);       // Slate 100

  // ─── Surface (Dark) ───
  static const Color darkBackground = Color(0xFF0F172A);  // Slate 900
  static const Color darkSurface = Color(0xFF1E293B);     // Slate 800
  static const Color darkSurfaceVariant = Color(0xFF334155); // Slate 700
  static const Color darkBorder = Color(0xFF334155);      // Slate 700
  static const Color darkDivider = Color(0xFF334155);

  // ─── JLPT Level Colors ───
  static const Color jlptN5 = Color(0xFF22C55E);  // Green
  static const Color jlptN4 = Color(0xFF3B82F6);  // Blue
  static const Color jlptN3 = Color(0xFF8B5CF6);  // Purple
  static const Color jlptN2 = Color(0xFFF97316);  // Orange
  static const Color jlptN1 = Color(0xFFEF4444);  // Red

  // ─── Reading Colors ───
  /// 음독 (Onyomi) - Teal
  static const Color onyomi = primary;
  /// 훈독 (Kunyomi) - Violet
  static const Color kunyomi = secondary;

  // ─── Component-specific ───
  static const Color chipBackground = background;
  static const Color chipSelected = Color(0xFFF0FDFA);   // Teal 50
  static const Color chipSelectedBorder = Color(0xFF99F6E4); // Teal 200

  // ─── Opacity helpers ───
  static Color primaryLight([double opacity = 0.1]) =>
      primary.withValues(alpha: opacity);
  static Color errorLight([double opacity = 0.1]) =>
      error.withValues(alpha: opacity);
  static Color successLight([double opacity = 0.1]) =>
      success.withValues(alpha: opacity);

  // ─── JLPT Color Getter ───
  static Color jlptColor(int level) {
    switch (level) {
      case 5: return jlptN5;
      case 4: return jlptN4;
      case 3: return jlptN3;
      case 2: return jlptN2;
      case 1: return jlptN1;
      default: return textMuted;
    }
  }

  // ─── ColorScheme builders ───
  static ColorScheme get lightScheme => ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.light,
    primary: primary,
    secondary: secondary,
    error: error,
    surface: surface,
  );

  static ColorScheme get darkScheme => ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.dark,
    primary: primary,
    secondary: secondary,
    error: error,
    surface: darkSurface,
  );
}
