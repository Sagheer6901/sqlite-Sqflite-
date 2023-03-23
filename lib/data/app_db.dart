import 'package:epsumlorem/data/raw_queries.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDB{

  static const newDbVersion = 1;
  static final AppDB _instance = AppDB.internal();
  factory AppDB() => _instance;
  AppDB.internal();
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async{
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "Epsumlorem.db");
    return await openDatabase(
        path,
        version: newDbVersion,
        onCreate: (Database db, int version) async {
          print('Invoke onCreate!');
          await db.execute(createTableUserProfile);
          await db.execute(createTableBlogPosts);
          await db.execute(createTableBookMarks);

        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          print('Invoke onUpgrade with onCreate!');
        });
  }


}