import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/report_details.dart';

class DatabaseHelper {
  static Database? _database;
  static const _databaseName = "smsApp.db";
  static const _databaseVersion = 1;

  static const reportDetailsTable = 'report_details';
  static const controlsTable = 'controls';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _createTables);
  }

  static Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $reportDetailsTable (
        id INTEGER PRIMARY KEY,
        type_of_report TEXT,
        severity REAL,
        location TEXT,
        id_string TEXT,
        additional_fields TEXT,
        process_status REAL,
        action_date_time TEXT,
        organisation_id TEXT,
        status REAL,
        created TEXT,
        updated TEXT,
        updated_by TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $controlsTable (
        control_id TEXT PRIMARY KEY,
        control_type REAL,
        control_function REAL,
        grid_group REAL,
        heading TEXT,
        description TEXT,
        is_required INTEGER,
        menu_name TEXT,
        print_group REAL,
        property_name TEXT,
        user_roles TEXT,
        params TEXT,
        text_case REAL,
        text_font REAL,
        is_control_visible INTEGER,
        value TEXT
      )
    ''');
  }

  static Future<void> insertReportDetails(ReportDetails reportDetails) async {
    final db = await database;
    await db.insert(reportDetailsTable, reportDetails.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateReportDetails(ReportDetails reportDetails) async {
    final db = await database;

    await db.update(
      reportDetailsTable,
      reportDetails.toJson(),
      where: 'id_string = ?',
      whereArgs: [reportDetails.idString], // Assuming 'id' is the primary key
    );

    print("updated");
  }

  static Future<List<ReportDetails>> getReportDetails() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(reportDetailsTable);

    return List.generate(maps.length, (i) {
      return ReportDetails(
        typeOfReport: maps[i]['type_of_report'],
        severity: maps[i]['severity'],
        location: maps[i]['location'],
        idString: maps[i]['id_string'],
        additionalFields: maps[i]['additional_fields'],
        processStatus: maps[i]['process_status'],
        actionDateTime: maps[i]['action_date_time'],
        organisationId: maps[i]['organisation_id'],
        status: maps[i]['status'],
        created: maps[i]['created'],
        updated: maps[i]['updated'],
        updatedBy: maps[i]['updated_by'],
      );
    });
  }
}
