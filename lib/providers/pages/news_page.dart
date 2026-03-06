import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> hasNewsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrNewsProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadNewsProvider = StateProvider<bool>((ref) => true);
