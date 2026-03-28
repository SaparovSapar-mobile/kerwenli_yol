import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/send.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/models/contact_us.dart';
import 'package:kerwenli_yol/pages/parts/open_social_list_tile.dart';
import 'package:kerwenli_yol/providers/api/contact_us.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ContactUsEmails extends ConsumerWidget {
  const ContactUsEmails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ========= Text Styles =======
    final TextStyle textStyle = AppTextStyles.medium10;

    final AsyncValue<ContactUsModel?> resultApi = ref.watch(
      fetchContactUsProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data == null) {
          return const SizedBox.shrink();
        }

        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: innerBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Social media salgylanmalar', style: textStyle),
              SizedBox(height: 10),
              ...data.emails.map(
                (e) => OpenSocialListTile(
                  icon: 'mail.png',
                  text: e,
                  onTap: () async {
                    await sendEmail(e);
                  },
                ),
              ),
            ],
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
