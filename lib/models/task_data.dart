import 'dart:collection';
import 'package:do_together/database/DatabaseHelper.dart';
import 'package:do_together/models/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{

  TaskData(){
    fetchTaskFromDatabase();
  }

  List<Task>_tasks = [];

  int getTaskCount() => _tasks.length;


  //fetching from database
  Future<void> fetchTaskFromDatabase() async{
    DateTime dt = DateTime.now();
    DatabaseHelper db = DatabaseHelper();
    _tasks = await db.getTaskFromDatabase();
    if(_tasks != null){
      notifyListeners();
    }
  }

  UnmodifiableListView<Task>getTasks(){
    return UnmodifiableListView(_tasks);
  }


  //add inn database
  Future<void>addInDatabase(Task task)async{
    DatabaseHelper db = DatabaseHelper();
    await db.insertTaskInDatabase(task);
  }

  void doneTask(Task task){
    task.isDone = true;
    updateTask(task);
  }

  void addTask(Task task){
    _tasks.add(task);
    addInDatabase(task);
    notifyListeners();
  }


  //update in database
  void updateTask(Task task){
    for(int i=0;i<_tasks.length;++i){
      if(_tasks[i].UID == task.UID){
        _tasks[i] = task;
        break;
      }
    }
    updateInDatabase(task);
    notifyListeners();
  }

  Future<void>updateInDatabase(Task task)async{
    DatabaseHelper db = DatabaseHelper();
    await db.updateTaskInDatabase(task);
  }

  //delete from database
  Future<void>removeTaskFromDataBase(Task task)async{
    DatabaseHelper db = DatabaseHelper();
    await db.deleteTaskFromDataBase(task);
  }

  void deleteTask(Task task){
    removeTaskFromDataBase(task);
    _tasks.remove(task);
    notifyListeners();
  }

}