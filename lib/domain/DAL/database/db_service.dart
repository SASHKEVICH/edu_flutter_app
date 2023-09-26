import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:edu_flutter_app/domain/models/calculator/calculation_history_record.dart';

class DBService {
  static Database? _database;

  final String _databaseName = 'Calculation_history';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDb();
    return _database!;
  }

  Future<void> addCalculationHistoryRecord(CalculationHistoryRecord record) async {
    Database db = await database;

    var newRecord = {
      'weight': record.weight,
      'speed': record.speed,
      'kinetic_energy': record.kineticEnergy
    };
    await db.insert(_databaseName, newRecord);
  }

  Future<List<CalculationHistoryRecord>> getAllCalculationHistoryRecords() async {
    Database db = await database;
    final List<Map<String, dynamic>> data = await db.query(_databaseName);

    return List.generate(data.length, (index) {
      return (
        weight: data[index]['weight'], 
        speed: data[index]['speed'], 
        kineticEnergy: data[index]['kinetic_energy']
      );
    });
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationCacheDirectory();
    String path = '${dir.path}/calculator.db';
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    var sqlQuery = """
      CREATE TABLE $_databaseName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        weight REAL,
        speed REAL,
        kinetic_energy REAL
      )
    """;
    await db.execute(sqlQuery);
  }
}