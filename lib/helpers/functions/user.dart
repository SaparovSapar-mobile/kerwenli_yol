import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/models/user.dart';

Future<String> getAccessToken() async {
  final UserModel user = await getUser();
  return user.token;
}
