import 'package:flutter_riverpod/flutter_riverpod.dart';

final descIdxProvider = StateNotifierProvider<DescriptionController,int>((ref) {
  return DescriptionController();
});


class DescriptionController extends StateNotifier<int>{
  DescriptionController() : super(0);

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}
