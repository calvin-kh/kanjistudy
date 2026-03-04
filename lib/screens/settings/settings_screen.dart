import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final dailyGoal = ref.watch(dailyGoalTargetProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          // ─── Theme ───
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('테마'),
            subtitle: Text(_themeName(themeMode)),
            onTap: () => _showThemeDialog(context, ref, themeMode),
          ),
          const Divider(),

          // ─── Daily Goal ───
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('일일 학습 목표'),
            subtitle: Text('$dailyGoal 한자'),
            onTap: () => _showGoalDialog(context, ref, dailyGoal),
          ),
          const Divider(),

          // ─── Legal ───
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('이용약관'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/terms'),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('개인정보처리방침'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/privacy'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('앱 정보'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/about'),
          ),
          const Divider(),

          // ─── Support ───
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('고객문의'),
            subtitle: const Text('kamuse.app@kamuse.com'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final uri = Uri.parse('mailto:kamuse.app@kamuse.com?subject=[칸지공부] 문의');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
          ),
          const Divider(),

          // ─── Data Reset ───
          ListTile(
            leading: const Icon(Icons.restart_alt, color: Colors.red),
            title: const Text('학습 데이터 초기화'),
            subtitle: const Text('즐겨찾기, 진도, 퀴즈 기록을 모두 삭제합니다'),
            onTap: () => _showResetDialog(context, ref),
          ),
        ],
      ),
    );
  }

  String _themeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system: return '시스템 설정';
      case ThemeMode.light: return '라이트';
      case ThemeMode.dark: return '다크';
    }
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref, ThemeMode current) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('테마 선택'),
        children: ThemeMode.values.map((mode) {
          return RadioListTile<ThemeMode>(
            value: mode,
            groupValue: current,
            title: Text(_themeName(mode)),
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeProvider.notifier).setThemeMode(value);
              }
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  void _showGoalDialog(BuildContext context, WidgetRef ref, int current) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('일일 학습 목표'),
        children: [5, 10, 15, 20, 30].map((count) {
          return RadioListTile<int>(
            value: count,
            groupValue: current,
            title: Text('$count 한자'),
            onChanged: (value) {
              if (value != null) {
                ref.read(dailyGoalTargetProvider.notifier).setTarget(value);
              }
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  void _showResetDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('데이터 초기화'),
        content: const Text('즐겨찾기, 학습 진도, 퀴즈 기록이 모두 삭제됩니다.\n이 작업은 되돌릴 수 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () async {
              // TODO: Implement data reset
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('학습 데이터가 초기화되었습니다')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('초기화'),
          ),
        ],
      ),
    );
  }
}
