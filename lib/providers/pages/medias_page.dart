import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> hasMediasProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrMediasProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadMediasProvider = StateProvider<bool>(
  (ref) => true,
);

final AutoDisposeStateProvider<bool> hasCMediasProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrCMediasProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadCMediasProvider = StateProvider<bool>(
  (ref) => true,
);
