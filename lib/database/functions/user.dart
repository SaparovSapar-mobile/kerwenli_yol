import 'package:kerwenli_yol/database/config.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:sqflite/sql.dart';

Future<void> createUser(UserModel user) async {
  if (db.isOpen) {
    // Kullanıcı var mı kontrol et
    final existingUser = await db.query('user');

    if (existingUser.isNotEmpty) {
      await deleteUser();
    }

    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<UserModel> getUser() async {
  UserModel data = UserModel.defaultValue();

  if (db.isOpen) {
    List<Map<String, dynamic>>? maps = await db.rawQuery("SELECT * FROM user");
    if (maps.isEmpty) return data;
    UserModel user = UserModel.fromJson(maps.first);
    data = user;
  }
  return data;
}

Future<void> deleteUser() async {
  if (db.isOpen) {
    await db.rawDelete('DELETE FROM user');
  }
}
