import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final consentProvider = StateNotifierProvider<ConsentNotifier, bool>((ref) {
  return ConsentNotifier();
});

class ConsentNotifier extends StateNotifier<bool> {
  ConsentNotifier() : super(false) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('consentAccepted') ?? false;
  }

  Future<void> accept() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('consentAccepted', true);
    state = true;
  }
}
