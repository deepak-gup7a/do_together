import 'dart:collection';
import 'package:do_together/database/DatabaseHelper.dart';
import 'package:do_together/models/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{

  TaskData(){
    fetchTaskFromDatabase();
  }

  List<Task>_tasks = [];
  List<Task>_allTasks = [];
  List<Task>_doneTasks = [];
  List<Task>_overdueTasks = [];

  int getTaskCount() => _tasks.length;

  int getAllTaskCount() => _allTasks.length;

  int getDoneTaskCount() => _doneTasks.length;

  int getOverdueTaskCount() => _overdueTasks.length;


  //fetching from database
  Future<void> fetchTaskFromDatabase() async{
    DatabaseHelper db = DatabaseHelper();
    _allTasks = await db.getTaskFromDatabase();
    if(_allTasks != null){
      _allTasks.sort((a,b)=>a.taskDeadline.isAfter(b.taskDeadline)==true?1:0);
      DateTime dateTime = DateTime.now();
      for(Task task in _allTasks){
        if(task.isDone == true){
          _doneTasks.add(task);
        }else{
          if(task.taskDeadline.isBefore(dateTime)){
            _overdueTasks.add(task);
          }
          _tasks.add(task);
        }
      }
      notifyListeners();
    }
  }

  //return all lists
  UnmodifiableListView<Task>getTasks(){
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task>getAllTasks(){
    return UnmodifiableListView(_allTasks);
  }

  UnmodifiableListView<Task>getDoneTasks(){
    return UnmodifiableListView(_doneTasks);
  }

  UnmodifiableListView<Task>getOverdueTasks(){
    return UnmodifiableListView(_overdueTasks);
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
    if(index == -1){
      index=_tasks.length;
    }
    _tasks.insert(index,task);
    _allTasks.add(task);
    notifyListeners();
  }


  Future<void>updateInDatabase(Task oldTask,Task newTask)async{
    DatabaseHelper db = DatabaseHelper();
    await db.updateDatabase(oldTask, newTask);
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
    _allTasks.remove(task);
    notifyListeners();
  }

  void doneTask(Task task){
    for(int i=0;i<_tasks.length;++i){
      if(_tasks[i].taskName == task.taskName){
        _tasks.removeAt(i);
        break;
      }
    }
    _doneTasks.add(task);
    deleteTask(Task(task.taskName,task.taskDescription,task.taskDeadline,false,task.remindOrNot));
    addInDatabase(task);
    notifyListeners();
  }

}