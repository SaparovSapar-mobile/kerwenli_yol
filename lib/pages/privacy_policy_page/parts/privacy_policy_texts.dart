import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/privacy_policy.dart';
import 'package:kerwenli_yol/providers/api/privacy_policy.dart';

class PrivacyPolicyTexts extends ConsumerWidget {
  const PrivacyPolicyTexts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<PrivacyPolicyModel?> resultApi = ref.watch(
      fetchPrivacyPolicyProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data == null) {
          return SizedBox.shrink();
        }

        final String desc = translateText(
          ref,
          data.descriptionTm,
          data.descriptionRu,
          data.descriptionEn,
          data.descriptionEn,
        );

        return Expanded(
          child: Html(
            data: desc,
            style: {
              "*": Style(
                fontWeight: FontWeight.w400,
                fontSize: FontSize(12),
                lineHeight: LineHeight.number(1.20),
                fontFamily: "Rubik",
              ),
            },
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => loadWidget,
    );
  }
}
