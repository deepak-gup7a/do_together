import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/utills/TimeDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  Task task = Task("", "", DateTime.now(), 10, false);
  bool forUpdate = false;
  AddTaskForm({this.task,this.forUpdate});

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {

  final _formKey = GlobalKey<FormState>();
  bool isRemind = false;
  String tName = "", tDesc = "";
  DateTime _time = DateTime.now();
  bool dChange=false,tChange=false;
  TimeDate timeDate = TimeDate();

  Future<void> getDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _time = timeDate.dateTimeFromDateTime(tChange==true?_time:widget.task.taskDeadline, picked);
        dChange = true;
      });
    }
  }

  Future<void> getTime() async {
    final TimeOfDay picked = await showTimePicker(
        context: context, initialTime: timeDate.dateTimeToTimeOfDate(_time));
    if (picked != null) {
      setState(() {
        _time = timeDate.timeOfDayToDateTime(dChange==true?_time:widget.task.taskDeadline, picked);
        tChange = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskData>(context).getTasks();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: widget.task.taskName,
                onChanged: (value) {
                  tName = value;
                },
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.text_fields,
                  ),
                  labelText: "Task",
                  hintText: "Task Name",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Task Name';
                  }
                  if(widget.forUpdate == false){
                    for (int i = 0; i < tasks.length; ++i) {
                      if (tasks[i].taskName == value)
                        return "Same name not allow";
                    }
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                initialValue: widget.task.taskDescription,
                onChanged: (value) {
                  tDesc = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  border: OutlineInputBorder(),
                  isDense: false,
                  prefixIcon: Icon(
                    Icons.text_fields,
                  ),
                  labelText: "Task Description (optional)",
                  hintText: "Task Description",
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () => getDate(),
                    ),
                    Text(
                      timeDate.getDateFromDateTime(dChange==false?widget.task.taskDeadline:_time),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.timer_sharp),
                      onPressed: () => getTime(),
                    ),
                    Text(
                      timeDate.getTimeFromDateTime(tChange==false?widget.task.taskDeadline:_time),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                height: 50.0,
                minWidth: 200.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                elevation: 5.0,
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (tName == "") {
                      tName = widget.task.taskName;
                    }
                    if (tDesc == "") {
                      tDesc = widget.task.taskDescription;
                    }
                    if(widget.forUpdate == true){
                      Provider.of<TaskData>(context,listen: false).updateTask(widget.task,Task(tName, tDesc, (dChange==true||tChange==true)?_time:widget.task.taskDeadline, 10, false));
                    }else{
                      Provider.of<TaskData>(context, listen: false).addTask(Task(tName, tDesc, (dChange==true||tChange==true)?_time:widget.task.taskDeadline, 10, false));
                    }
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
