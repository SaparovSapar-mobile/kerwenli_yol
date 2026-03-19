const String userTable = '''CREATE TABLE "user" 
    ("id" TEXT, "name" TEXT, "email" TEXT, "phone" TEXT,
    "image" TEXT, "token" TEXT);''';

final String favoritesTable =
    'CREATE TABLE "favorites" ("id"	TEXT,	"type" TEXT);';

String searchsTable = 'CREATE TABLE "searchs" ("search" TEXT, "type" TEXT);';
