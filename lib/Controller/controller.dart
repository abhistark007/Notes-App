
// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:notes_app_local_storage/Models/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesController {
  //late Future<Database> mydb;
  static Future<Database> getMyDB() async{
  var myDb =await openDatabase(join(await getDatabasesPath(), 'notes_database.db'),);
  return myDb;
  }

  //inserting data in the table
  static Future<void> insert(Notes notes) async{
    final db=await NotesController.getMyDB();
    await db.insert("notes", notes.toMap());
    Get.snackbar("Successfully", "inserted data");
    
  }

  // displaying all the data in the table
  static Future<List<NotesOutput>> getNotes()async{
    final db=await NotesController.getMyDB();
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
    return NotesOutput(
      id: maps[i]['id'],
      title: maps[i]['title'],
      desc: maps[i]['desc'],
    );
  });
  }

  //updating data
  static Future updateNotes(Notes notes,String oldDesc)async{
    final db=await NotesController.getMyDB();
     await db.update(
    'notes',
    notes.toMap(),
    where: 'desc = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [oldDesc],
  );
  }

}