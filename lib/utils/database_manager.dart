// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:money_manager/utils/expense.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();
  static const int _version = 1;
  static const String dbName = 'transaction_table';

  static Future<Database> getDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'money_manager.db');

    return openDatabase(
      path,
      version: _version,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $dbName (id INT PRIMARY KEY, time TEXT, category TEXT, description TEXT, account TEXT, amount NUM)',
        );
      },
    );
  }

  static Future<int> addData(Expense expense, BuildContext context) async {
    final db = await getDatabase();
    if (!context.mounted) return 0;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data Added.')));
    return await db.insert(
      dbName,
      expense.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteData(Expense expense) async {
    final db = await getDatabase();

    return await db.rawDelete(
        'DELETE FROM $dbName WHERE category = ? AND description = ? AND account = ? AND amount = ?',
        [
          expense.category,
          expense.description,
          expense.account,
          expense.amount
        ]);
  }

  static Future<List<Expense>?> getAllTransactions() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(dbName);

    if (maps.isEmpty) return null;

    return List.generate(
      maps.length,
      (index) {
        return Expense.fromJson(
          maps[index],
        );
      },
    );
  }
}
