import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme.dart';
import 'providers/settings_provider.dart';
import 'router/app_router.dart';

class KanjiStudyApp extends ConsumerWidget {
  const KanjiStudyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: '칸지공부',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
