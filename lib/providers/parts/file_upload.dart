import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/search.dart';

final AutoDisposeStateProvider<bool> loadUploadImageProvider =
    StateProvider.autoDispose<bool>((ref) => false);
// final StateProvider<String> imagePathProvider = StateProvider<String>(
//   (ref) => '',
// );

final StateProvider<bool> isVisualSearchModeProvider = StateProvider<bool>(
  (ref) => false,
);

final StateProvider<SearchModel?> visualSearchResultProvider =
    StateProvider<SearchModel?>((ref) => SearchModel.defaultValue());
