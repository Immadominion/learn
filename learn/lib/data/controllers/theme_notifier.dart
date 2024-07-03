import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState(isDarkMode: false));

  void toggleTheme() {
    state = ThemeState(isDarkMode: !state.isDarkMode);
  }

  void setDarkMode(bool value) {
    state = ThemeState(isDarkMode: value);
  }
}

class ThemeState {
  final bool isDarkMode;

  ThemeState({required this.isDarkMode});
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});
