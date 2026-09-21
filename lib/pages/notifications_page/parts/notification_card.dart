import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/models/notification.dart';
import 'package:kerwenli_yol/providers/api/notification.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

/// Карточка одного уведомления.
/// Непрочитанное отмечено оранжевой точкой слева и более жирным заголовком -
/// по нажатию отметка снимается и уходит запрос на сервер.
class NotificationCard extends ConsumerStatefulWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  ConsumerState<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends ConsumerState<NotificationCard> {
  late bool _isRead = widget.notification.isRead;
  bool _sending = false;

  Future<void> _markRead() async {
    if (_isRead || _sending) return;

    final String userUuid = await ref.read(getUserIdProvider.future);
    if (userUuid.isEmpty) return;

    _sending = true;
    // отметку показываем сразу, не дожидаясь сервера - так отзывчивее
    setState(() => _isRead = true);

    final bool ok = await ref
        .read(notificationApiProvider)
        .markAsRead(
          userUuid: userUuid,
          notificationUuid: widget.notification.id,
        );

    _sending = false;
    if (!ok) {
      // сервер не принял - возвращаем как было
      if (mounted) setState(() => _isRead = false);
      return;
    }
    // обновляем бейдж на колокольчике
    ref.invalidate(unreadNotificationsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final NotificationModel n = widget.notification;

    // ======== Colors ========
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color titleColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color descColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color accent = isLight ? LightColors.primary : DarkColors.primary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _markRead,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // непрочитанное выделяем фоном, прочитанное остаётся плоским
          color: _isRead ? null : bgColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 8),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _isRead ? Colors.transparent : accent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    n.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (_isRead
                                ? AppTextStyles.medium14
                                : AppTextStyles.semiBold14)
                            .copyWith(color: titleColor),
                  ),
                  // description приходит с сервера как HTML
                  Html(
                    data: n.description,
                    style: {
                      'body': Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        color: descColor,
                        fontSize: FontSize(12),
                      ),
                      'p': Style(
                        margin: Margins.only(top: 4),
                        padding: HtmlPaddings.zero,
                      ),
                    },
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n.formattedDate,
                    style: AppTextStyles.regular10.copyWith(color: descColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
