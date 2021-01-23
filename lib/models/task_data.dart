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
    DatabaseHelper db = DatabaseHelper();
    _tasks = await db.getTaskFromDatabase();
    if(_tasks != null){
      _tasks.sort((a,b)=>a.taskDeadline.isAfter(b.taskDeadline)==true?1:0);
      for(int i=0;i<_tasks.length;++i){
        if(_tasks[i].isDone == true){
          Task task = _tasks[i];
          _tasks.removeAt(i);
          _tasks.add(task);
        }
      }
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

  void addTask(Task task){
    addInDatabase(task);
    int index=-1;
    for(int i=0;i<_tasks.length;++i){
      if(task.taskDeadline.isBefore(_tasks[i].taskDeadline)){
        index=i;
      }
    }
    if(index == -1 || task.isDone == true){
      index=_tasks.length;
    }
    _tasks.insert(index,task);
    notifyListeners();
  }


  //update in database
  void updateTask(Task oldTask,Task newTask){
    deleteTask(oldTask);
    addTask(newTask);
    for(int i=0;i<_tasks.length;++i){
      if(_tasks[i].taskName == oldTask.taskName){
        _tasks[i] = newTask;
      }
    }
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

  void doneTask(Task task){
    for(int i=0;i<_tasks.length;++i){
      if(_tasks[i].taskName == task.taskName){
        deleteTask(task);
        addTask(Task(task.taskName,task.taskDescription,task.taskDeadline,10,true));
        break;
      }
    }
    notifyListeners();
  }

}