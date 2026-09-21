import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/notification.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/pages/notifications_page/parts/notification_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/notification.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

/// Вкладка "Bildiriş" - собственные уведомления пользователя.
/// Эндпоинт требует client_uuid, поэтому незалогиненному показываем
/// предложение войти, а не пустой список.
class NotificationsTab extends ConsumerWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String> userId = ref.watch(getUserIdProvider);

    return userId.when(
      loading: () => loadWidget,
      error: (_, _) => NoResult(),
      data: (id) {
        if (id.isEmpty) return const _LoginPrompt();

        final AsyncValue<List<NotificationModel>> result = ref.watch(
          fetchNotificationsProvider,
        );

        return result.when(
          loading: () => loadWidget,
          error: (_, _) => NoResult(),
          data: (items) {
            if (items.isEmpty) return NoResult();

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(fetchNotificationsProvider);
                ref.invalidate(unreadNotificationsProvider);
                await ref.read(fetchNotificationsProvider.future);
              },
              color: LightColors.primary,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    NotificationCard(notification: items[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class _LoginPrompt extends ConsumerWidget {
  const _LoginPrompt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/no_result.png', height: 112),
            const SizedBox(height: 20),
            Text(
              lang.loginToSeeNotifications,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium14.copyWith(color: textColor),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: lang.logIn,
              onPressed: () => goToPage(
                context,
                LoginPage(),
                AxisDirection.left,
                name: 'login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
