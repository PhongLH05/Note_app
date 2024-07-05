

import 'package:sqflite/sqflite.dart';

class SqliteDb {
  final _dbName = 'note.db';
  final _tableName = 'note_details';

  initDb() async {
    String path = await getDatabasesPath();
  }
}