import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/notifiers/inputs.dart';

var clearNameProvider = StateProvider.autoDispose<bool>((ref) => false);
var clearEmailProvider = StateProvider.autoDispose<bool>((ref) => false);
var clearPhoneProvider = StateProvider.autoDispose<bool>((ref) => false);

var showPassProvider = StateProvider.autoDispose<bool>((ref) => false);

var otpCodeProvider = StateProvider<String>((ref) => '');

// ====== Providers For Loading =============
var sendOTPCodeBtnPressProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);
var checkOTPCodeBtnPressProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);
var loginBtnPressProvider = StateProvider.autoDispose<bool>((ref) => false);

var categoriesProvider = StateNotifierProvider<CategoriesNotifier, List<int>>(
  (ref) => CategoriesNotifier(),
);
