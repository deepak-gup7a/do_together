
class Task{

  String _UID;
  String _taskName;
  String _taskDescription;
  bool _isDone;
  //List<String>_tags;

  //constructor
  Task(this._UID,this._taskName, this._taskDescription,this._isDone);

  //getters
  String get UID => _UID;



  String get taskDescription => _taskDescription;

  String get taskName => _taskName;

  bool get isDone => _isDone;



  //List<String> get tags => _tags;


  //setters

  set taskDescription(String value) {
    _taskDescription = value;
  }

  set taskName(String value) {
    _taskName = value;
  }


  set isDone(bool value){
    _isDone = value;
  }

  // set tags(List<String> value) {
  //   _tags = value;
  // }

  Map<String,dynamic>toMap(){
    return {
      "UID":_UID,
      "taskname":_taskName,
      "taskdescription":_taskDescription,
      //"tags":_tags.toString(),
      "isdone":(_isDone==true)?1:0,
    };
  }

}