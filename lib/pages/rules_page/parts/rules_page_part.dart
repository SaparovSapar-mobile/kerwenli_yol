import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/contact_us.dart';
import '../../../providers/api/contact_us.dart';
import '../../../styles/text_styles.dart';
import 'rules_top_part.dart';

class RulesPagePart extends ConsumerWidget {
  const RulesPagePart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ContactUsModel?> resultApi = ref.watch(fetchContactUsProvider);

    return resultApi.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();

        // Текст правил — приходит с API или захардкожен
        const String rulesText = '''
## 1. Terms

Tellus at sit ante rutrum suspendisse pretium, vitae vel dignissim. Nunc, scelerisque adipiscing condimentum massa dignissim tortor leo lacus. Sapien felis ultrices fringilla nisi sit nibh. Etiam volutpat nisl ornare lorem mus at a, et pulvinar.

## 2. Use License

Fermentum erat nisl duis varius risus. Augue ac facilisi porta metus enim. Ullamcorper lacus praesent rhoncus, sapien rutrum nulla mattis vitae ultrices.

- Fermentum erat nisl duis varius risus.
- Augue ac facilisi porta metus enim.
- Ullamcorper lacus praesent rhoncus, sapien rutrum nulla mattis vitae ultrices.
- Nunc, scelerisque adipiscing condimentum massa dignissim tortor leo lacus.

Aliquam eget purus sit malesuada tempor euismod. Eget commodo ultricies ut elit hendrerit risus. Elementum tellus nisl lectus bibendum malesuada orci dui. Nunc pharetra.
''';

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RulesTopPart(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: MarkdownBody(
                data: rulesText, // или data.rulesText если приходит с API
                onTapLink: (text, href, title) {
                  if (href != null) launchUrl(Uri.parse(href));
                },
                styleSheet: MarkdownStyleSheet(
                  h2: AppTextStyles.semiBold14,
                  p: AppTextStyles.regular14,
                  listBullet: AppTextStyles.regular14,
                ),
              ),
            ),
          ],
        );
      },
      error: (_, _) => RulesTopPart(),
      loading: () => RulesTopPart(),
    );
  }
}