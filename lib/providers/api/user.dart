import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/services/api/user.dart';

final userApiProvider = Provider<UserApiService>((ref) => UserApiService());

var registerUserProvider = FutureProvider.autoDispose
    .family<bool, RegisterUserModel>((ref, arg) async {
      bool result = false;

      try {
        result = await ref.read(userApiProvider).registerUser(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });
