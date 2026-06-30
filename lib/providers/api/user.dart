import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/check_otp.dart';
import 'package:kerwenli_yol/models/login_user.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/models/send_otp.dart';
import 'package:kerwenli_yol/models/update_password.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/services/api/user.dart';

// модель для phone confirm
class ConfirmPhoneOtpParams {
  final String phone, code;
  const ConfirmPhoneOtpParams({required this.phone, required this.code});
}

final AutoDisposeFutureProviderFamily<bool, ConfirmPhoneOtpParams>
confirmPhoneOtpProvider = FutureProvider.autoDispose
    .family<bool, ConfirmPhoneOtpParams>((ref, arg) async {
      return await ref
          .read(userApiProvider)
          .confirmPhoneOtp(phone: arg.phone, code: arg.code);
    });

final Provider<UserApiService> userApiProvider = Provider<UserApiService>(
  (ref) => UserApiService(),
);

final AutoDisposeFutureProviderFamily<ResultRegister, RegisterUserModel>
registerUserProvider = FutureProvider.autoDispose
    .family<ResultRegister, RegisterUserModel>((ref, arg) async {
      ResultRegister result = ResultRegister.defaultResult();

      try {
        result = await ref.read(userApiProvider).registerUser(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

final AutoDisposeFutureProviderFamily<ResultRegister, ForgotModel>
sendOtpProvider = FutureProvider.autoDispose
    .family<ResultRegister, ForgotModel>((ref, arg) async {
      ResultRegister result = ResultRegister.defaultResult();

      try {
        result = await ref.read(userApiProvider).forgotPass(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

final AutoDisposeFutureProviderFamily<ResultRegister, UpdatePasswordModel>
updatePasswordProvider = FutureProvider.autoDispose
    .family<ResultRegister, UpdatePasswordModel>((ref, arg) async {
      ResultRegister result = ResultRegister.defaultResult();

      try {
        result = await ref.read(userApiProvider).updatePassword(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

final AutoDisposeFutureProviderFamily<bool, CheckOtpModel> verifyEmailProvider =
    FutureProvider.autoDispose.family<bool, CheckOtpModel>((ref, arg) async {
      bool result = false;

      try {
        result = await ref.read(userApiProvider).verifyEmail(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

final AutoDisposeFutureProviderFamily<UserModel, LoginUserModel>
loginUserProvider = FutureProvider.autoDispose
    .family<UserModel, LoginUserModel>((ref, arg) async {
      UserModel result = UserModel.defaultValue();

      try {
        result = await ref.read(userApiProvider).loginUser(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });
