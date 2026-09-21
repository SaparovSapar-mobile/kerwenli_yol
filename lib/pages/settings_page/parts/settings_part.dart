import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/language_button.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_passcode_button.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/theme_button.dart';
import 'package:kerwenli_yol/providers/api/notification.dart';
import 'package:kerwenli_yol/providers/api/profile.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class SettingsPart extends ConsumerWidget {
  const SettingsPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // синхронизируем переключатель с сервером (например, после захода
    // с другого устройства) - но не перетираем то, что юзер только что
    // сам переключил в этой же сессии
    ref.listen<AsyncValue<bool?>>(serverIsNotificationProvider, (
      previous,
      next,
    ) {
      final bool? serverValue = next.value;
      if (serverValue == null) return;

      final bool localValue = ref.read(openNotificationProvider);
      if (serverValue != localValue) {
        ref.read(openNotificationProvider.notifier).update(serverValue);
      }
    });

    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lang.settings),
          SizedBox(height: 5),
          LanguageButton(),
          ThemeButton(),
          SettingPartCard(
            index: 2,
            text: lang.soundNotifications,
            icon: Icons.notifications,
            settingProvider: openNotificationProvider,
            onSettingChanged: (value) async {
              final String userUuid = await ref.read(getUserIdProvider.future);
              if (userUuid.isEmpty) return;

              try {
                await ref
                    .read(notificationApiProvider)
                    .updateNotificationPreference(
                      userUuid: userUuid,
                      isNotification: value,
                    );
              } catch (_) {
                // локальный переключатель уже обновлён — не блокируем UI,
                // если бэкенд недоступен
              }
            },
          ),
          SettingPasscodeButton(index: 3),
        ],
      ),
    );
  }
}
