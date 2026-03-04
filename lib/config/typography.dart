import 'package:flutter/material.dart';
import 'color_scheme.dart';

/// KanjiStudy Typography Tokens
abstract final class AppTypography {
  // ─── Kanji Display Styles ───

  /// 한자 히어로 표시 - 72px, Bold
  static const TextStyle kanjiHero = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  /// 한자 카드 표시 - 40px, Bold
  static const TextStyle kanjiLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// 한자 목록 표시 - 28px, SemiBold
  static const TextStyle kanjiMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// 음독 (Onyomi) - 16px, Medium, Teal
  static const TextStyle onyomi = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.onyomi,
    height: 1.4,
  );

  /// 훈독 (Kunyomi) - 16px, Medium, Violet
  static const TextStyle kunyomi = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.kunyomi,
    height: 1.4,
  );

  /// 뜻/의미 - 16px, Regular, Slate 500
  static const TextStyle meaning = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  /// 예제 일본어 - 18px, Medium
  static const TextStyle exampleJapanese = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  /// 예제 번역 - 14px, Regular, Slate 500
  static const TextStyle exampleTranslation = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ─── UI Text Styles ───

  /// 화면 제목 - 20px, Bold
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// 섹션 제목 - 18px, Bold
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// 카드 제목 - 16px, SemiBold
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// 본문 - 14px, Regular
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  /// 보조 본문 - 14px, Regular, Secondary
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  /// 캡션 - 12px, Regular, Muted
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.4,
  );

  /// 라벨 - 12px, Medium
  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// 버튼 텍스트 - 14px, SemiBold
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// 배지/카운트 - 12px, Bold
  static const TextStyle badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  /// 통계 숫자 - 32px, Bold
  static const TextStyle statNumber = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 1.2,
  );
}
