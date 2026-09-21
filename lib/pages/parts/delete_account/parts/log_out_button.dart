import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/database/favorite.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/services/analytics_service.dart';

class LogOutButton extends ConsumerWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      text: 'Hawa',
      onPressed: () async {
        await deleteUser();
        await deleteAllFavorites();
        // отвязываем события аналитики от ушедшего пользователя
        AnalyticsService().setUserId(null);
        ref.invalidate(getUserProvider);
        ref.invalidate(getUserIdProvider);
        ref.invalidate(hasInFavoritesProvider);
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    );
  }
}
