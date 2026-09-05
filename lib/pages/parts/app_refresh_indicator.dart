import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

/// Обёртка "потяни, чтобы обновить".
/// [providers] сбрасываются при свайпе вниз - список сам перезагрузит данные.
/// Если нужно дождаться конкретного запроса - передай [onRefresh].
class AppRefreshIndicator extends ConsumerWidget {
  const AppRefreshIndicator({
    super.key,
    this.providers = const [],
    this.onRefresh,
    required this.child,
  });

  final List<ProviderOrFamily> providers;
  final Future<void> Function(WidgetRef ref)? onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);

    return RefreshIndicator(
      color: isLight ? LightColors.primary : DarkColors.primary,
      backgroundColor: isLight
          ? LightColors.bgBlogLight
          : DarkColors.bgBlogDark,
      onRefresh: () async {
        for (final ProviderOrFamily provider in providers) {
          ref.invalidate(provider);
        }

        if (onRefresh != null) {
          await onRefresh!(ref);
          return;
        }

        // списки постраничные - ждём короткую паузу,
        // дальше свой индикатор загрузки показывает сам список
        await Future.delayed(const Duration(milliseconds: 400));
      },
      child: child,
    );
  }
}
