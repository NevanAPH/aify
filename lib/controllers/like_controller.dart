import 'package:aify/models/liked_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LikeController extends GetxController {
  // CRUD table database
  static Database? _db;

  // list data yang digunakan untuk menampun hasil database, .obs diguanakan di UI
  var my_favorites = <LikedModel>[].obs;
  final my_favorites_loaded = false.obs;

  Future<Database?> get db async {
    _db ??= await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'aify_test_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS likes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            liked INTEGER
          )
        ''');
      },
    );
  }
  Future<void> like(LikedModel music) async {
    final db = await this.db;
    final liked = music.liked;
    await db!.insert('likes', {'liked': liked ? 1 : 0});
  }

  Future<void> unlike(LikedModel music) async {
    final db = await this.db;
    final liked = music.liked;
    await db!.delete('likes', where: 'liked = ?', whereArgs: [liked ? 1 : 0]);
  }

  Future<void> getLiked() async {
    final db = await this.db;
    final List<Map<String, dynamic>> results = await db!.query('likes');
    my_favorites.value = results.map((e) => LikedModel.from(e)).toList();
  }

  Future<void> clearLiked() async {
    final db = await this.db;
    await db!.delete('likes');
  }
}