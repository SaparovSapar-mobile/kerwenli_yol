import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/services/api/profile.dart';

final Provider<ProfileApiService> profileApiProvider = Provider<ProfileApiService>(
  (ref) => ProfileApiService(),
);
