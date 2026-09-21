import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/notifiers/inputs.dart';

final AutoDisposeStateProvider<bool> clearNameProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final AutoDisposeStateProvider<bool> clearEmailProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final AutoDisposeStateProvider<bool> clearPhoneProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final AutoDisposeStateProvider<bool> showPassProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final AutoDisposeStateProvider<String> otpCodeProvider =
    StateProvider.autoDispose<String>((ref) => '');

final AutoDisposeStateProvider<int> passCodeCounterProvider =
    StateProvider.autoDispose<int>((ref) => 0);
final StateProvider<String> firstPassCodeProvider = StateProvider<String>(
  (ref) => '',
);

// ====== Providers For Loading =============
final AutoDisposeStateProvider<bool> sendOTPCodeBtnPressProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final AutoDisposeStateProvider<bool> checkOTPCodeBtnPressProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final AutoDisposeStateProvider<bool> loginBtnPressProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final AutoDisposeStateProvider<bool> saveProfileBtnPressProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final AutoDisposeStateProvider<bool> sendMessageBtnPressProvider =
    StateProvider.autoDispose<bool>((ref) => false);

/// выбранные в фильтре подкатегории (uuid)
final StateNotifierProvider<SubCategoryFiltersNotifier, List<String>>
subCategoryFiltersProvider =
    StateNotifierProvider<SubCategoryFiltersNotifier, List<String>>(
      (ref) => SubCategoryFiltersNotifier(),
    );

final StateNotifierProvider<CategoriesNotifier, List<int>> categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, List<int>>(
      (ref) => CategoriesNotifier(),
    );
