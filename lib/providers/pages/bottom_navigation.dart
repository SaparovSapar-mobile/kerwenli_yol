import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<int> selectedBottomIndexProvider =
    StateProvider.autoDispose<int>((ref) => 0);
