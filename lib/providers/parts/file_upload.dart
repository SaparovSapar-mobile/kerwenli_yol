import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> loadUploadImageProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final StateProvider<String> imagePathProvider = StateProvider<String>(
  (ref) => '',
);
