import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/check_otp.dart';
import 'package:kerwenli_yol/models/login_user.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/models/send_otp.dart';
import 'package:kerwenli_yol/models/update_password.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/services/api/user.dart';

final userApiProvider = Provider<UserApiService>((ref) => UserApiService());

var registerUserProvider = FutureProvider.autoDispose
    .family<ResultRegister, RegisterUserModel>((ref, arg) async {
      ResultRegister result = ResultRegister.defaultResult();

      try {
        result = await ref.read(userApiProvider).registerUser(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

var sendOtpProvider = FutureProvider.autoDispose
    .family<ResultRegister, SendOtpModel>((ref, arg) async {
      ResultRegister result = ResultRegister.defaultResult();

      try {
        result = await ref.read(userApiProvider).sendOtp(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

var updatePasswordProvider = FutureProvider.autoDispose
    .family<ResultRegister, UpdatePasswordModel>((ref, arg) async {
      ResultRegister result = ResultRegister.defaultResult();

      try {
        result = await ref.read(userApiProvider).updatePassword(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

var verifyEmailProvider = FutureProvider.autoDispose
    .family<bool, CheckOtpModel>((ref, arg) async {
      bool result = false;

      try {
        result = await ref.read(userApiProvider).verifyEmail(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

var loginUserProvider = FutureProvider.autoDispose
    .family<UserModel, LoginUserModel>((ref, arg) async {
      UserModel result = UserModel.defaultValue();

      try {
        result = await ref.read(userApiProvider).loginUser(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });
