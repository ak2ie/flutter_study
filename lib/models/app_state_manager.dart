import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateManager = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier()
);

class AppState {
  int selectedTab;

  AppState(this.selectedTab);
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState(0));

  void goToTab(index) {
    state = index;
  }
}

