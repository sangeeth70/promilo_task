import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateNotifierProvider<DashboardController,int>((ref) {
  return DashboardController();
});

final bottomNavIndexProvider = StateProvider<int>((ref) {
  return 2; // Default selected index
});

class DashboardController extends StateNotifier<int>{
  DashboardController() : super(0);

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}

