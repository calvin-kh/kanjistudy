import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme mode provider
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString('themeMode') ?? 'system';
    state = ThemeMode.values.byName(mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.name);
  }
}

/// Daily goal target
final dailyGoalTargetProvider = StateNotifierProvider<DailyGoalTargetNotifier, int>((ref) {
  return DailyGoalTargetNotifier();
});

class DailyGoalTargetNotifier extends StateNotifier<int> {
  DailyGoalTargetNotifier() : super(10) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt('dailyGoalTarget') ?? 10;
  }

  Future<void> setTarget(int target) async {
    state = target;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('dailyGoalTarget', target);
  }
}

/// Kanji display mode (grid vs list)
final kanjiDisplayModeProvider = StateProvider<KanjiDisplayMode>((ref) => KanjiDisplayMode.grid);

enum KanjiDisplayMode { grid, list }
