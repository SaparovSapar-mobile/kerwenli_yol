import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/notifications_page/notifications_page.dart';
import 'package:kerwenli_yol/providers/api/notification.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeTopNotificationButton extends ConsumerWidget {
  const HomeTopNotificationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    // число непрочитанных для бейджа; при ошибке и без логина - 0
    final int unread = ref.watch(unreadNotificationsProvider).value ?? 0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        await goToPage(
          context,
          const NotificationsPage(),
          AxisDirection.left,
          name: 'notifications',
        );
        // вернулись со страницы - что-то могли прочитать, обновляем бейдж
        ref.invalidate(unreadNotificationsProvider);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8.5),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.notifications, color: iconColor, size: 18),
          ),
          if (unread > 0)
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                constraints: const BoxConstraints(minWidth: 16),
                height: 16,
                decoration: BoxDecoration(
                  color: LightColors.primary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: bgColor, width: 1.5),
                ),
                child: Center(
                  child: Text(
                    // трёхзначные числа не влезают в кружок
                    unread > 99 ? '99+' : '$unread',
                    style: AppTextStyles.medium10.copyWith(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
