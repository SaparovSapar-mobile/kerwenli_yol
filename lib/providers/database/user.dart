import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/models/user.dart';

final AutoDisposeFutureProvider<UserModel> getUserProvider =
    FutureProvider.autoDispose<UserModel>((ref) async {
      UserModel user = await getUser();
      return user;
    });
