class Task{
  String _taskName;

  Task();

  Task(this._taskName);

  String get taskName => _taskName;

  set taskName(String value) {
    _taskName = value;
  }


}