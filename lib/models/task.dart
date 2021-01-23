
class Task{

  String _taskName;
  String _taskDescription;
  DateTime _taskDeadline;
  int _beforeRemind;
  bool _isDone;
  //List<String>_tags;

  //constructor
  Task(this._taskName, this._taskDescription, this._taskDeadline, this._beforeRemind,this._isDone);

  //getters
  DateTime get taskDeadline => _taskDeadline;

  String get taskDescription => _taskDescription;

  String get taskName => _taskName;

  bool get isDone => _isDone;

  //List<String> get tags => _tags;

  int get beforeRemind => _beforeRemind;

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


  set beforeRemind(int value) {
    _beforeRemind = value;
  }

  set isDone(bool value){
    _isDone = value;
  }

  // set tags(List<String> value) {
  //   _tags = value;
  // }

  Map<String,dynamic>toMap(){
    return {
      "taskname":_taskName,
      "taskdescription":_taskDescription,
      "taskdeadline":_taskDeadline.toIso8601String(),
      "beforeremind":_beforeRemind,
      //"tags":_tags.toString(),
      "isdone":(_isDone==true)?1:0
    };
  }

}