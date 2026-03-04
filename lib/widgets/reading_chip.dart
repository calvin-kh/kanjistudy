import 'package:flutter/material.dart';
import '../config/color_scheme.dart';
import '../config/spacing.dart';

class ReadingChip extends StatelessWidget {
  final String label;
  final String reading;
  final bool isOnyomi;

  const ReadingChip({
    super.key,
    required this.label,
    required this.reading,
    required this.isOnyomi,
  });

  @override
  Widget build(BuildContext context) {
    final color = isOnyomi ? AppColors.onyomi : AppColors.kunyomi;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            reading,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
