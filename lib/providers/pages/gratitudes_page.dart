import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> hasGratitudesProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrGratitudesProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadGratitudesProvider = StateProvider<bool>(
  (ref) => true,
);
