import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> gridOrListsortProvider = StateProvider<int>(
  (ref) => 0,
);
final StateProvider<bool> isGridCompaniesProvider = StateProvider<bool>(
  (ref) => true,
);

// =======  Start For Vip Companies =====
final StateProvider<int> gridOrListVipCompaniesSortProvider =
    StateProvider<int>((ref) => 0);
final StateProvider<bool> isGridVipCompaniesProvider = StateProvider<bool>(
  (ref) => true,
);
// =======  End For Vip Companies =====
