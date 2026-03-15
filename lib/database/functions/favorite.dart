import 'package:kerwenli_yol/database/config.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> hasInFavorites(FavoriteModel favorite) async {
  if (!db.isOpen) return false;

  final List<Map<String, Object?>> result = await db.rawQuery(
    'SELECT COUNT(*) as count FROM favorites WHERE id = ? AND type = ?',
    [favorite.id, favorite.type],
  );

  final int count = Sqflite.firstIntValue(result) ?? 0;
  return count > 0;
}

Future<void> addOrRemoveFromFavorites(FavoriteModel favorite) async {
  if (!db.isOpen) return;

  // Parametreli sorgu ile COUNT al (SQL injection'dan korur)
  final List<Map<String, Object?>> result = await db.rawQuery(
    'SELECT COUNT(*) as count FROM favorites WHERE id = ? AND type = ?',
    [favorite.id, favorite.type],
  );

  final int count = Sqflite.firstIntValue(result) ?? 0;

  if (count > 0) {
    // Kayıt varsa sil
    await db.delete(
      'favorites',
      where: 'id = ? AND type = ?',
      whereArgs: [favorite.id, favorite.type],
    );
  } else {
    // Yoksa ekle
    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<void> deleteAllFavorites() async {
  if (!db.isOpen) return;
  await db.delete('favorites'); // <- tüm kayıtları siler
}
