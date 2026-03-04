import 'package:flutter/material.dart';
import 'color_scheme.dart';

/// KanjiStudy Typography Tokens
///
/// 색상은 의미적 컬러(onyomi, kunyomi, statNumber)만 지정.
/// 나머지는 Theme이 라이트/다크 자동 적용.
abstract final class AppTypography {
  // ─── Kanji Display Styles ───

  static const TextStyle kanjiHero = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    height: 1.1,
  );

  static const TextStyle kanjiLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle kanjiMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  /// 음독 - Teal
  static const TextStyle onyomi = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.onyomi,
    height: 1.4,
  );

  /// 훈독 - Violet
  static const TextStyle kunyomi = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.kunyomi,
    height: 1.4,
  );

  static const TextStyle meaning = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle exampleJapanese = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.6,
  );

  static const TextStyle exampleTranslation = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // ─── UI Text Styles ───

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  /// 통계 숫자 - Primary color
  static const TextStyle statNumber = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 1.2,
  );
}
