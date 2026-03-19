import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/search.dart';

final AutoDisposeStateProvider<String> searchECommerceTextProvider =
    StateProvider.autoDispose<String>((ref) => '');
final AutoDisposeStateProvider<bool> openSearchECommerceHistoryProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<String> eCommerceSearchProvider = StateProvider<String>(
  (ref) => '',
);

final AutoDisposeFutureProviderFamily<List<String>, String> getSearchsProvider =
    FutureProvider.family.autoDispose<List<String>, String>((ref, arg) async {
      return await getSearchs(arg);
    });
