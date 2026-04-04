import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<bool> confirmPrivacyProvider = StateProvider<bool>(
  (ref) => false,
);
