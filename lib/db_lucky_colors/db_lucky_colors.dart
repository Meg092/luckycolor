import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'lucky_colors_entity.dart';
import 'lucky_colors_util.dart';

class DB extends GetxService {
  Database? _database;

  Future<DB> init() async {
    await dbBase;
    return this;
  }

  Future<Database> get dbBase async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'lucky_colors.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE lucky_colors (
            last_updated TEXT
          );
        ''');
        await db.execute('''
          CREATE TABLE prosperity (
            day TEXT NOT NULL UNIQUE,
            lucky_color1 TEXT,
            lucky_color2 TEXT,
            unlucky_color1 TEXT,
            unlucky_color2 TEXT
          );
        ''');
        await db.execute('''
          CREATE TABLE wealth (
            day TEXT NOT NULL UNIQUE,
            lucky_color1 TEXT,
            lucky_color2 TEXT,
            unlucky_color1 TEXT,
            unlucky_color2 TEXT
          );
        ''');
        await db.execute('''
          CREATE TABLE fortune (
            day TEXT NOT NULL UNIQUE,
            lucky_color1 TEXT,
            lucky_color2 TEXT,
            unlucky_color1 TEXT,
            unlucky_color2 TEXT
          );
        ''');
      },
    );
  }

  Future<bool> hasUpdatedThisWeek() async {
    final db = await dbBase;
    final result = await db.rawQuery('SELECT last_updated FROM lucky_colors');
    final lastUpdated =
        result.isEmpty ? null : result.first['last_updated'] as String?;

    if (lastUpdated == null) {
      await db.insert('lucky_colors', {
        'last_updated': DateTime.now().toIso8601String(),
      });
      return false;
    }

    final now = DateTime.now();
    final lastUpdate = DateTime.parse(lastUpdated);

    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeekDate = DateTime(
      startOfWeek.year,
      startOfWeek.month,
      startOfWeek.day,
    );

    return lastUpdate.isAfter(startOfWeekDate) ||
        lastUpdate.isAtSameMomentAs(startOfWeekDate);
  }

  Future<void> autoUpdateAllTables() async {
    if (await hasUpdatedThisWeek()) return;

    final tables = ['prosperity', 'wealth', 'fortune'];

    for (String tableName in tables) {
      await updateWeeklyColorsForTable(tableName);
    }
  }

  Future<void> updateWeeklyColorsForTable(String tableName) async {
    final db = await dbBase;
    try {
      await db.transaction((txn) async {
        final counts = await txn.rawQuery(
          'SELECT COUNT(*) as count FROM $tableName',
        );
        if (counts.first['count'] as int > 0) {
          await txn.delete(tableName);
        }

        final weeklyColors = ColorGenerator.generateWeeklyColorsForTable(
          tableName,
        );

        for (var entity in weeklyColors) {
          await txn.insert(tableName, entity.toMap());
        }

        await txn.update('lucky_colors', {
          'last_updated': DateTime.now().toIso8601String(),
        });
      });
    } catch (e) {
      print('updateWeeklyColorsForTable error: $e');
    }
  }

  Future<List<LuckyColorsEntity>> getColorsForTable(String tableName) async {
    final db = await dbBase;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    final sortedMaps = <Map<String, dynamic>>[];
    for (String day in weekDays.take(7)) {
      final dayData = maps.where((map) => map['day'] == day).toList();
      if (dayData.isNotEmpty) {
        sortedMaps.addAll(dayData);
      }
    }

    return List.generate(
      sortedMaps.length,
      (i) => LuckyColorsEntity.fromMap(sortedMaps[i]),
    );
  }

  Future<List<LuckyColorsEntity>> getColorsForTableByDay(
    String tableName,
    String day,
  ) async {
    final db = await dbBase;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'day = ?',
      whereArgs: [day],
    );

    return List.generate(
      maps.length,
      (i) => LuckyColorsEntity.fromMap(maps[i]),
    );
  }

  Future<void> clearAllTables() async {
    final db = await dbBase;
    try {
      await db.delete('lucky_colors');
      await db.delete('prosperity');
      await db.delete('wealth');
      await db.delete('fortune');
    } catch (e) {
      print('clearColors error: $e');
    }
  }

  @override
  void onClose() {
    _database?.close();
    super.onClose();
  }
}
