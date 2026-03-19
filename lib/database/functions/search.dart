import 'package:kerwenli_yol/database/config.dart';
import 'package:sqflite/sqflite.dart';

Future<void> createSearch(String search, String type) async {
  if (db.isOpen) {
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM searchs WHERE search = ? AND type = ?',
      [search, type],
    );

    int count = Sqflite.firstIntValue(result) ?? 0;

    if (count == 0) {
      await db.insert('searchs', {
        'search': search,
        'type': type,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}

Future<List<String>> getSearchs(String type) async {
  if (db.isOpen) {
    List<String> searchs = [];

    List<Map<String, dynamic>>? maps = await db.rawQuery(
      "SELECT search FROM searchs WHERE type='$type'",
    );

    for (var map in maps) {
      String id = map['search'] as String;
      searchs.add(id);
    }

    return searchs;
  }
  return [];
}

Future<void> removeSearch(String search, String type) async {
  if (db.isOpen) {
    await db.rawDelete(
      "DELETE FROM searchs WHERE search='$search' AND  type='$type'",
    );
  }
}
