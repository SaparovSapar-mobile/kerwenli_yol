import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/providers/database/user.dart';

class UserProfilePart extends ConsumerWidget {
  const UserProfilePart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<UserModel> resultDB = ref.watch(getUserProvider);

    return resultDB.when(
      data: (data) {
        if (data.id == '' || data.token == '') {
          return const SizedBox.shrink();
        }

        return Text(data.name);
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
