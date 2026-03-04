import 'package:flutter/material.dart';
import '../config/color_scheme.dart';
import '../config/spacing.dart';

class JlptBadge extends StatelessWidget {
  final int level;
  final double? fontSize;

  const JlptBadge({
    super.key,
    required this.level,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColors.jlptColor(level);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppSpacing.borderRadiusSm,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        'N$level',
        style: TextStyle(
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
