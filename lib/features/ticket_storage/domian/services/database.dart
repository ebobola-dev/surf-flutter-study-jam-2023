import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:surf_flutter_study_jam_2023/config/database_config.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService db = DatabaseService._();

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await init();
    return _database!;
  }

  static Future<Database> init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'ticket.db'),
      onCreate: (db, version) {
        return db.execute(DatabaseConfig.createSQLQuery);
      },
      version: 1,
    );
  }

  static Future<List<Ticket>> getAllTickets() async {
    final db = await database;
    final ticketMaps = await db.query(DatabaseConfig.ticketDatabaseName);
    return ticketMaps.map((ticketMap) => Ticket.fromJson(ticketMap)).toList();
  }

  static Future<void> saveTicket(Ticket ticket) async {
    final db = await database;
    await db.insert(
      DatabaseConfig.ticketDatabaseName,
      ticket.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateTicket(Ticket ticket) async {
    final db = await database;
    await db.update(
      DatabaseConfig.ticketDatabaseName,
      ticket.toJson(),
      where: 'url = ?',
      whereArgs: [ticket.url],
    );
  }

  static Future<void> deleteTicket(String ticketUrl) async {
    final db = await database;
    await db.delete(
      DatabaseConfig.ticketDatabaseName,
      where: 'url = ?',
      whereArgs: [ticketUrl],
    );
  }

  static Future<void> deleteAllTickets() async {
    final db = await database;
    await db.delete(DatabaseConfig.ticketDatabaseName);
  }
}
