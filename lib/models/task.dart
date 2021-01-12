
class Task{

  String _taskName;
  String _taskDescription;
  DateTime _taskDeadline;
  bool _isRemind;
  bool _isDone;

  //constructor
  Task(this._taskName, this._taskDescription, this._taskDeadline, this._isRemind,this._isDone);

  //getters

  DateTime get taskDeadline => _taskDeadline;

  String get taskDescription => _taskDescription;

  String get taskName => _taskName;

  bool get remindOrNot => _isRemind;

  bool get isDone => _isDone;

  //setters
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

  set isDone(bool value){
    _isDone = value;
  }

  Map<String,dynamic>toMap(){
    return {
      "taskname":_taskName,
      "taskdescription":_taskDescription,
      "taskdeadline":_taskDeadline.toIso8601String(),
      "isremind":(_isRemind==true)?1:0,
      "isdone":(_isDone==true)?1:0
    };
  }
}