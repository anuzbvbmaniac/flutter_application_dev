import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/model/note.dart';

class DatabaseHelper {

  /**
   * Singleton database helper
   * --> What is Singleton? -> This instance _databaseHelper will only be initialized 
   * only once throughout the application i.e. throughout the application life cycle we
   * are going to crate one instance of DatabseHelper class and use it in our app till 
   * the app shuts donw.
   */
  static DatabaseHelper _databaseHelper; 

  static Database _database; //singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //named constructr to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton Object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if(_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    //get directory path for both Android and IOS to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    //open/create database at the given path
    var notesDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');

  }

  //CRUD

  //fetch operation : Get all notes from databse
  Future<List<Map<String, dynamic>>> getnoteMapList() async {
    Database db = await this.database;

    //var result = await db.rawQuery('SELECT * FROM $noteTable oreder by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }


  //insert Operation : insert a note into a database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;

    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Update Operation : update the note and save it to database
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  //Delete operation : delete a note from database
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result = db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  //get number of notes in the database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }


}