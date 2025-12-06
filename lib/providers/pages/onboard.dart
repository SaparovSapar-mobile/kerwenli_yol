import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Onboard sayfa indexi (zaten sende büyük ihtimalle var)
final onboardPageIndexProvider = StateProvider<int>((ref) => 0);
