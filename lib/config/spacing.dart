import 'package:flutter/material.dart';

/// KanjiStudy Spacing & Shape Tokens (4px base)
abstract final class AppSpacing {
  // ─── Spacing Scale ───
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;

  // ─── Edge Insets Presets ───
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets screenPadding = EdgeInsets.all(lg);
  static const EdgeInsets sectionPadding = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: xs,
  );
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: 14,
  );
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: 14,
  );
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  // ─── Gaps ───
  static const SizedBox gapXs = SizedBox(height: xs);
  static const SizedBox gapSm = SizedBox(height: sm);
  static const SizedBox gapMd = SizedBox(height: md);
  static const SizedBox gapLg = SizedBox(height: lg);
  static const SizedBox gapXl = SizedBox(height: xl);
  static const SizedBox gapXxl = SizedBox(height: xxl);

  static const SizedBox gapHXs = SizedBox(width: xs);
  static const SizedBox gapHSm = SizedBox(width: sm);
  static const SizedBox gapHMd = SizedBox(width: md);
  static const SizedBox gapHLg = SizedBox(width: lg);

  // ─── Border Radius ───
  static const double radiusSm = 4;
  static const double radiusMd = 8;
  static const double radiusLg = 12;
  static const double radiusXl = 16;
  static const double radiusFull = 9999;

  static final BorderRadius borderRadiusSm = BorderRadius.circular(radiusSm);
  static final BorderRadius borderRadiusMd = BorderRadius.circular(radiusMd);
  static final BorderRadius borderRadiusLg = BorderRadius.circular(radiusLg);
  static final BorderRadius borderRadiusXl = BorderRadius.circular(radiusXl);
  static final BorderRadius borderRadiusFull = BorderRadius.circular(radiusFull);

  // ─── Elevation ───
  static const double elevationNone = 0;
  static const double elevationLow = 1;
  static const double elevationMedium = 2;
  static const double elevationHigh = 4;
  static const double elevationNav = 8;

  // ─── Icon Sizes ───
  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;
  static const double iconXl = 32;
  static const double iconXxl = 48;

  // ─── Grid ───
  static const double listGap = md;
  static const double gridGap = md;
  static const double kanjiGridSize = 80;
}
