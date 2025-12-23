import 'package:kerwenli_yol/database/tables.dart';
import 'package:sqflite/sqflite.dart';

late Database db;

Future<void> createDB() async {
  var dbPath = await getDatabasesPath();
  final path = '$dbPath/trading.db';

  db = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(userTable);
      return;
    },
  );
}
