import 'dart:async';
import 'dart:io';
import 'package:note_keeper/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static late final DatabaseHelper _databaseHelper; // Singleton DatabaseHelper

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
}
