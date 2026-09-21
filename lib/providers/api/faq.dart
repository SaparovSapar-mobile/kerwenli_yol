import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/services/api/faq.dart';

final Provider<FaqApiService> faqApiProvider = Provider<FaqApiService>(
  (ref) => FaqApiService(),
);

/// uuid пункта FAQ, к которому крепим обращения из "Hat ýazmak".
/// Берём пункт про службу поддержки, если он есть, иначе - первый.
final AutoDisposeFutureProvider<String> supportFaqUuidProvider =
    FutureProvider.autoDispose<String>((ref) async {
      const String supportFaqUuid = '48cd1644-7f34-48a8-9d41-16cb997ce512';

      final List<dynamic> faqs = await ref.read(faqApiProvider).fetchFaqs();
      if (faqs.isEmpty) return '';

      for (final dynamic faq in faqs) {
        if (faq is Map && faq['uuid'] == supportFaqUuid) return supportFaqUuid;
      }

      final dynamic first = faqs.first;
      return first is Map ? (first['uuid'] ?? '') : '';
    });
