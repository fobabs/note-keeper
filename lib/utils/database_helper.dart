import 'dart:async';
import 'dart:io';
import 'package:note_keeper/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static late final DatabaseHelper _databaseHelper =
      DatabaseHelper._createInstance(); // Singleton DatabaseHelper
  static late final Database _database; // Singleton Database

  static late final noteTable;
  static late final colId;
  static late final colTitle;
  static late final colDescription;
  static late final colPriority;
  static late final colDate;

  DatabaseHelper._createInstance(); // Named Constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<Database> get database async {
    _database = await initializeDatabase();

    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both android and ios to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path} notes.db';

    // Open/create the database at a given path
    final notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INT, $colDate TEXT)');
  }

  // Fetch Operation: Get all objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;
    /* Writing raw SQL
    final result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    */
    final result = await db.query(noteTable,
        orderBy: '$colPriority ASC'); // Helper function
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await database;
    final result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    Database db = await database;
    final result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note oject from database
  Future<int> deleteNote(int id) async {
    Database db = await database;
    final result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }
}
