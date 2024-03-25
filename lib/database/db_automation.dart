import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dataAutomation.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();
  static Database? _database;

  //Initialize Database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  // Check Database Presence
  Future<Database> initDatabase() async {
    final getDirectory = await getApplicationDocumentsDirectory();
    String path = '${getDirectory.path}/automations.db';
    log(path);
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  //Create
  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Automations(id TEXT PRIMARY KEY, label TEXT, feature TEXT)');
    log('TABLE CREATED');
  }

  //List or Show
  Future<List<dataAutomation>> getAutomations() async {
    final db = await _databaseService.database;
    var data = await db.rawQuery('SELECT * FROM Automations');
    List<dataAutomation> automations = List.generate(
        data.length, (index) => dataAutomation.fromJson(data[index]));
    print(automations.length);
    return automations;
  }

  //Insert
  Future<void> insertAutomation(dataAutomation automation) async {
    final db = await _databaseService.database;
    var data = await db.rawInsert(
        'INSERT INTO Automations(id, label, feature ) VALUES(?,?,?)',
        [automation.id, automation.label, automation.feature]);
    log('inserted $data');
  }

  // Update
  Future<void> editAutomation(dataAutomation automation) async {
    final db = await _databaseService.database;
    var data = await db.rawUpdate(
        'UPDATE Automations SET label=?,feature=? WHERE ID=?',
        [automation.label, automation.feature, automation.id]);
    log('updated $data');
  }

  // Delete
  Future<void> deleteAutomation(String id) async {
    final db = await _databaseService.database;
    var data = await db.rawDelete('DELETE from Automations WHERE id=?', [id]);
    log('deleted $data');
  }
}
