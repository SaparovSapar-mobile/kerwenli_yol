import 'package:flutter_riverpod/flutter_riverpod.dart';

var clearNameProvider = StateProvider.autoDispose<bool>((ref) => false);
var clearEmailProvider = StateProvider.autoDispose<bool>((ref) => false);
var clearPhoneProvider = StateProvider.autoDispose<bool>((ref) => false);

var showPassProvider = StateProvider.autoDispose<bool>((ref) => false);

var otpCodeProvider = StateProvider<String>((ref) => '');

// ====== Providers For Loading =============
var sendOTPCodeBtnPressProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);
