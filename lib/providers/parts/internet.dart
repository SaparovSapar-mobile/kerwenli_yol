import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/internet.dart';

var checkInConnProvider = FutureProvider.autoDispose<bool>((ref) async {
  return await checkIntWithContextConn();
});
