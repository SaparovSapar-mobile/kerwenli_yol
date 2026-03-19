import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<String> searchECommerceTextProvider =
    StateProvider.autoDispose<String>((ref) => '');
final AutoDisposeStateProvider<bool> openSearchECommerceHistoryProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<String> eCommerceSearchProvider = StateProvider<String>(
  (ref) => '',
);
