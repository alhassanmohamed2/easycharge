import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageDatabase {
  String path = '';
  var database;
  int no_paths = 0;
  var ImagesPaths;
  Future getDataBase() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'demo.db');
  }

  Future openDataBase() async {
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS images (id INTEGER PRIMARY KEY, path TEXT)');
    });
  }

  Future dataGet() async {
    ImagesPaths = await database.rawQuery('SELECT * FROM images');
    no_paths = ImagesPaths.length;
  }

  Future dataUpdate(String path) async {
    await database.transaction((txn) async {
      txn.rawInsert('INSERT INTO images(path) VALUES("$path")');
    });
  }
}
