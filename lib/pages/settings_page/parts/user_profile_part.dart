import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile.dart';
import 'package:kerwenli_yol/providers/database/user.dart';

class UserProfilePart extends ConsumerWidget {
  const UserProfilePart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserModel> resultDB = ref.watch(getUserProvider);

    return resultDB.when(
      data: (data) {
        final bool noUser = data.id == '' || data.token == '';
        if (noUser) {
          return const SizedBox.shrink();
        }

        return UserProfile(user: data, forUserPage: false);
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
