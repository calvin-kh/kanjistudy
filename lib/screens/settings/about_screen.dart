import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('앱 정보')),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          final version = snapshot.data?.version ?? '-';
          final buildNumber = snapshot.data?.buildNumber ?? '-';

          return ListView(
            padding: AppSpacing.screenPadding,
            children: [
              AppSpacing.gapXl,
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: AppSpacing.borderRadiusXl,
                      ),
                      child: const Icon(
                        Icons.menu_book,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                    AppSpacing.gapLg,
                    Text('한자 학습', style: AppTypography.headlineLarge),
                    AppSpacing.gapXs,
                    Text(
                      'KanjiStudy',
                      style: AppTypography.bodyMedium,
                    ),
                    AppSpacing.gapSm,
                    Text(
                      'v$version ($buildNumber)',
                      style: AppTypography.caption,
                    ),
                  ],
                ),
              ),
              AppSpacing.gapXxl,
              const Divider(),
              ListTile(
                title: const Text('JLPT 한자 데이터'),
                subtitle: const Text('N5~N1 상용한자'),
              ),
              ListTile(
                title: const Text('개발'),
                subtitle: const Text('Flutter + Dart'),
              ),
              ListTile(
                title: const Text('라이선스'),
                subtitle: const Text('오픈소스 라이선스'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: '한자 학습',
                    applicationVersion: 'v$version',
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
