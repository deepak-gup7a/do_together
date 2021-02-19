import 'dart:async';
import 'package:do_together/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper{
  Future<Database>createDatabase()async{
    return await openDatabase(
      join(await getDatabasesPath(),'do_together.db'),
      onCreate: (db,version){
        return db.execute(
          "CREATE TABLE TASK(UID TEXT,taskname TEXT,taskdescription TEXT,isdone INTEGER)",
        );
      },
      version: 1
    );
  }
Future<void>insertTaskInDatabase(Task task)async{
    Database db;
    try{
      db = await createDatabase();
      await db.insert('TASK', task.toMap());
    }catch(e){
      print(e);
    }finally{
      await db.close();
    }
  }

  Future<List<Task>>getTaskFromDatabase()async{
    Database db;
    try{
      db = await createDatabase();
      final List<Map<String,dynamic>> maps = await db.query('TASK');
      return List.generate(maps.length, (index)  {
        return Task(
            maps[index]["UID"],
            maps[index]['taskname'],
            maps[index]['taskdescription'],
            maps[index]['isdone']==0?false:true,
        );
      });
    }catch(e){
      print(e);
    }finally{
      db.close();
    }
    return [];
  }

  Future<void>deleteTaskFromDataBase(Task task)async{
    Database db;
    try{
      db = await createDatabase();
      await db.rawDelete('DELETE FROM TASK WHERE UID = ?',[task.UID]);
    }
    catch(e){
      print(e);
    }finally{
      db.close();
    }
  }

  Future<void>updateTaskInDatabase(Task task)async{
    Database db;
    try{
      db = await createDatabase();
      await db.update('TASK',task.toMap(),where: "UID = ?",whereArgs: [task.UID]);
    }catch(e){
      print(e);
    }finally{
      db.close();
    }
  }

}
