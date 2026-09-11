import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageDatabase {
  // Singleton pattern
  static final ImageDatabase _instance = ImageDatabase._internal();
  factory ImageDatabase() => _instance;
  ImageDatabase._internal();

  String path = '';
  Database? database;
  int no_paths = 0;
  List<Map<String, dynamic>> ImagesPaths = [];
  List<Map<String, dynamic>> dates = [];
  List<Map<String, dynamic>> date_images = [];

  Future<void> getDataBase() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'cards.db');
  }

  Future<void> openDataBase() async {
    if (database != null && database!.isOpen) return;
    
    database = await openDatabase(
      path, 
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS images (id INTEGER PRIMARY KEY, path TEXT, date TEXT)'
        );
      }
    );
  }

  Future<void> dataGet() async {
    if (database == null) return;
    ImagesPaths = await database!.rawQuery('SELECT path, date FROM images');
    dates = await database!.rawQuery('SELECT date FROM images GROUP BY date');
  }

  Future<void> countImages() async {
    if (database == null) return;
    var ImagesCount = await database!.rawQuery('SELECT id FROM images ORDER BY id DESC LIMIT 1');
    if (ImagesCount.isNotEmpty) {
      no_paths = ImagesCount[0]['id'] as int;
    } else {
      no_paths = 0;
    }
  }

  Future<void> dataSpe(String condition) async {
    if (database == null) return;
    date_images = await database!.rawQuery("SELECT path FROM images WHERE date = ?", [condition]);
  }

  Future<void> dataUpdate(String imagePath) async {
    if (database == null) return;
    DateTime now = DateTime.now();
    String date = "${now.year} - ${now.month} - ${now.day}";

    await database!.transaction((txn) async {
      await txn.rawInsert('INSERT INTO images(path, date) VALUES(?, ?)', [imagePath, date]);
    });
  }

  Future<void> delete_images() async {
    if (database == null) return;
    await database!.transaction((txn) async {
      await txn.rawDelete('DELETE FROM images');
    });
  }

  Future<void> close() async {
    if (database != null && database!.isOpen) {
      await database!.close();
      database = null;
    }
  }
}
