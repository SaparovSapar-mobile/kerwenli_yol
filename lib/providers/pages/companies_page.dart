import 'package:flutter_riverpod/flutter_riverpod.dart';

var companySortIndexProvider = StateProvider<int>((ref) => 0);
var companyMessageListtileIndexProvider = StateProvider<int>((ref) => 0);

final AutoDisposeStateProvider<bool> hasBCompaniesProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrBCompaniesProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadBCompaniesProvider = StateProvider<bool>(
  (ref) => true,
);

final AutoDisposeStateProvider<bool> hasCompaniesProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final StateProvider<bool> hasErrCompaniesProvider = StateProvider<bool>(
  (ref) => false,
);
final StateProvider<bool> loadCompaniesProvider = StateProvider<bool>(
  (ref) => true,
);
