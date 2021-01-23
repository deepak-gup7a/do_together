import 'package:do_together/models/notes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class NotesDatabaseHelper{

  Future<Database>createDatabase()async{
    return await openDatabase(
        join(await getDatabasesPath(),'do_together.db'),
        onCreate: (db,version){
          return db.execute(
            "CREATE TABLE NOTES(title TEXT, date TEXT,content TEXT,authorname TEXT)",
          );
        },
        version: 1
    );
  }

  Future<void>insertNoteInDatabase(Note note)async{
    Database db;
    try{
      db = await createDatabase();
      await db.insert('NOTES', note.toMap());
    }catch(e){
      print(e);
    }finally{
      await db.close();
    }
  }

  Future<List<Note>>getNotesFromDatabase()async{
    Database db;
    try{
      db = await createDatabase();
      final List<Map<String,dynamic>> maps = await db.query('NOTES');
      return List.generate(maps.length, (index)  {
        return Note(
            title:maps[index]['title'],
            uploadDate:DateTime.parse(maps[index]['date']),
            content:maps[index]["content"],
            authorName:maps[index]['authorname'],
        );
      });
    }catch(e){
      print(e);
    }finally{
      db.close();
    }
    return [];
  }

  Future<void>deleteTaskFromDataBase(Note note)async{
    Database db;
    try{
      db = await createDatabase();
      await db.rawDelete('DELETE FROM NOTES WHERE title = ?',[note.title]);
    }
    catch(e){
      print(e);
    }finally{
      db.close();
    }
  }


}