import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> hasCProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrCProductsProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadCProductsProvider = StateProvider<bool>(
  (ref) => true,
);
