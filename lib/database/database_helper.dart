import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database db;

  static DatabaseHelper? instance;

  DatabaseHelper._();

  DatabaseHelper.init() {
    print('INIT');
    instance ??= DatabaseHelper._();
    print('INITIALIZED');
  }

  static const databaseName = 'movie.db';
  static const databaseVersion = 1;

  static const table = 'movie_table';

  static const movieId = 'id';
  static const movieImage = 'image';
  static const movieName = 'title';
  static const movieRating = 'rating';
  static const movieDescription = 'desc';

  static Future<void> initialize() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);
    db = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: createDataBase,
    );
  }

  static void createDataBase(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table (
        $movieId INTEGER PRIMARY KEY, 
        $movieImage TEXT, 
        $movieName TEXT, 
        $movieRating TEXT, 
        $movieDescription TEXT
        )
        ''');
  }

  // static Future<int> queryRowCount() async {
  //   final results = await db.rawQuery('SELECT COUNT(*) FROM $table');
  //   return Sqflite.firstIntValue(results) ?? 0;
  // }

  static Future<int> insertData(Map<String, dynamic> row) async {
    return await db.insert(table, row);
  }

  static Future<int> deleteData(String movie) async {
    return await db.delete(
      table,
      where: '$movieName = ?',
      whereArgs: [movie],
    );
  }

  static Future<bool> contains(String movie) async {
    final result =
        //await db.query('''SELECT * FROM $table WHERE $movieName IS $movie''');
        await db.query(
      table,
      columns: [movieName],
      where: '$movieName = ?',
      whereArgs: [movie],
    );

    print('Result :::::::: $result');
    if (result.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static Future<List> getData() async {
    return await db.rawQuery('''SELECT * FROM $table''');
  }
}

//
// List<Map> maps = await db.query(tableTodo,
// ///      columns: ['columnId', 'columnDone', 'columnTitle'],
// ///      where: 'columnId = ?',
// ///      whereArgs: [id]);
