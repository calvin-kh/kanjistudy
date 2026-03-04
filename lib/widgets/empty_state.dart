import 'package:flutter/material.dart';
import '../config/color_scheme.dart';
import '../config/typography.dart';
import '../config/spacing.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.textMuted),
            AppSpacing.gapLg,
            Text(title, style: AppTypography.headlineMedium, textAlign: TextAlign.center),
            if (subtitle != null) ...[
              AppSpacing.gapSm,
              Text(subtitle!, style: AppTypography.bodyMedium, textAlign: TextAlign.center),
            ],
            if (action != null) ...[
              AppSpacing.gapXl,
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
