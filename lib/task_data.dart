import 'dart:collection';

import 'package:do_together/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{
  List<Task>_tasks = [];

  int getTaskCount()=>_tasks.length;

  UnmodifiableListView<Task>getTasks(){
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(){
    //update task
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}