import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/privacy_policy.dart';
import 'package:kerwenli_yol/services/api/privacy_policy.dart';

final Provider<PrivacyPolicyApiService> privacyPolicyApiProvider =
    Provider<PrivacyPolicyApiService>((ref) => PrivacyPolicyApiService());

final AutoDisposeFutureProvider<PrivacyPolicyModel?>
fetchPrivacyPolicyProvider = FutureProvider.autoDispose<PrivacyPolicyModel?>((
  ref,
) async {
  PrivacyPolicyModel? result;

  try {
    result = await ref.read(privacyPolicyApiProvider).fetchPrivacyPolicy();
  } catch (e) {
    rethrow;
  }
  return result;
});
