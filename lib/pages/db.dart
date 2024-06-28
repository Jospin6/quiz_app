import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db{
   static const int _version = 1;
  static const String _dbName = 'favoryte.db';

  static final table = 'citation';
  static final columnId = 'id';
  static final columnContent = 'content';
  static final columnVerset = 'verset';

  static Future<Database> _getDb() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute("CREATE TABLE citation ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnContent TEXT, $columnVerset TEXT)"),
      version: _version
    );
  }


  // Insert a row into the database
  Future<int> insert(String content, String verset) async {
    Database db = await _getDb();
    Map<String, dynamic> row = {columnContent: content,columnVerset: verset};
    return await db.insert("citation", row,conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await _getDb();
    final List<Map<String,dynamic>> maps = await db.query("citation");
    return maps;
  }
 

}