import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedScreenProvider =
    StateNotifierProvider<SelectedScreenNotifier, String>((ref) {
  return SelectedScreenNotifier();
});

// StateNotifier (For managing state)
class SelectedScreenNotifier extends StateNotifier<String> {
  SelectedScreenNotifier() : super('Recipient Screen'); // Initial state

  void setSelectedScreen(String newScreen) {
    state = newScreen;
  }
}
