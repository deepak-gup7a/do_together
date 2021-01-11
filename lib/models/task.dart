import 'package:flutter/material.dart';

class Task{

  String _taskName;
  String _taskDescription;
  DateTime _taskDeadline;
  bool _isRemind;
  DateTime _remindTime;

  //constructor
  Task(this._taskName, this._taskDescription, this._taskDeadline, this._isRemind, this._remindTime);

  //getters
  DateTime get remindTime => _remindTime;

  DateTime get taskDeadline => _taskDeadline;

  String get taskDescription => _taskDescription;

  String get taskName => _taskName;

  bool get remindOrNot => _isRemind;

  //setters
  set remindTime(DateTime value) {
    _remindTime = value;
  }

  set taskDeadline(DateTime value) {
    _taskDeadline = value;
  }

  set taskDescription(String value) {
    _taskDescription = value;
  }

  set taskName(String value) {
    _taskName = value;
  }

  set isRemind(bool value) {
    _isRemind = value;
  }
  Map<String,dynamic>toMap(){
    return {
      "taskname":_taskName,
      "taskdescription":_taskDescription,
      "taskdeadline":_taskDeadline.toIso8601String(),
      "isremind":(_isRemind==true)?1:0,
      "remindtime":_remindTime.toIso8601String()
    };
  }
}