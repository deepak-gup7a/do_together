import 'dart:collection';
import 'package:do_together/database/DatabaseHelper.dart';
import 'package:do_together/models/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{
  List<Task>_tasks = [];

  int getTaskCount(){
    if(_tasks!=null)
      return _tasks.length;
    return 0;
  }


  Future<void> fetchTaskFromDatabase() async{
    DatabaseHelper db = DatabaseHelper();
    _tasks = await db.getTaskFromDatabase();
    if(_tasks != null)
      notifyListeners();
  }

  UnmodifiableListView<Task>getTasks(){
    return UnmodifiableListView(_tasks);
  }

  Future<void>addInDatabase(Task task)async{
    DatabaseHelper db = DatabaseHelper();
    await db.insertTaskInDatabase(task);
  }

  void addTask(Task task){
    addInDatabase(task);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(){
    //update task
  }
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