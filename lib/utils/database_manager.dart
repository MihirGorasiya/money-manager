// ignore_for_file: depend_on_referenced_packages

import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();
  static const int _version = 1;

  static Future<Database> getDatabase(String databaseName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}/money_manager.db';
    return openDatabase(
      join(path, databaseName),
      onCreate: (db, version) async => await db.execute(
        'CREATE TABLE $databaseName(id INTEGER PRIMARY , noteDetails TEXT, isCanceled num)',
      ),
      version: _version,
    );
  }

  static Future<int> addData(String databaseName,String category, String description, Float amount, DateTime time) async {
    final db = await getDatabase(databaseName);
    Map<String, dynamic> values = {
      'category': category,
      'description': description,
      'amount': amount,
      'time': time,
    };

    return await db.insert(
      databaseName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
