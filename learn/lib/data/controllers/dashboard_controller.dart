import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(DashboardState(selectedIndex: 0, isTop: false));

  void setActiveTab(int value) {
    state = DashboardState(selectedIndex: value);
    log("Active tab is == $state");
  }

  void setAsActive(bool value) {
    state = DashboardState(selectedIndex: 0, isTop: value);
    log("Quizzes is set as Active == $value");

    Timer(const Duration(milliseconds: 1000), () {
      state = DashboardState(selectedIndex: 0, isTop: !value);
      log("Quizzes is now 1000ms == ${!value}");
    });
  }
}

class DashboardState {
  final int selectedIndex;
  final bool isTop;

  DashboardState({required this.selectedIndex, this.isTop = false});
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  return DashboardNotifier();
});
