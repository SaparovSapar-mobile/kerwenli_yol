import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> hasSponsorsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrSponsorsProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadSponsorsProvider = StateProvider<bool>(
  (ref) => true,
);
