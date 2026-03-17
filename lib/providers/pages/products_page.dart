import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> hasCProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrCProductsProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadCProductsProvider = StateProvider<bool>(
  (ref) => true,
);

final AutoDisposeStateProvider<bool> hasFProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrFProductsProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadFProductsProvider = StateProvider<bool>(
  (ref) => true,
);
