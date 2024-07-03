import 'package:flutter_riverpod/flutter_riverpod.dart';

class BiometricSwitchNotifier extends StateNotifier<bool> {
  BiometricSwitchNotifier() : super(false);

  void toggle() => state = !state;
  void setValue(bool value) => state = value;
}

final biometricSwitchProvider =
    StateNotifierProvider<BiometricSwitchNotifier, bool>((ref) {
  return BiometricSwitchNotifier();
});
