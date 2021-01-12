
import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/utills/TimeDate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {

  final _formKey = GlobalKey<FormState>();
  bool isRemind = false;
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  DateTime _time= DateTime.now();
  TimeDate timeDate = TimeDate();

  Future<void>getDate()async{
    final DateTime picked= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2030));
    if(picked!=null){
      setState(() {
        _time = picked;
      });
    }
  }

  Future<void>getTime()async{
    final TimeOfDay picked = await showTimePicker(context: context, initialTime: timeDate.dateTimeToTimeOfDate(_time));
    if(picked!=null){
      setState(() {
        _time = timeDate.timeOfDayToDateTime(_time,picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _taskNameController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.text_fields, color: Colors.white,),
                    labelText: "Task",
                    hintText: "Task Name",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Task Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: _taskDescriptionController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                    isDense: false,
                    prefixIcon: Icon(Icons.text_fields, color: Colors.white,),
                    labelText: "Task Description (optional)",
                    hintText: "Task Description",
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.date_range), onPressed:()=>getDate(), color: Colors.white,),
                      Text(
                          timeDate.getDateFromDateTime(_time),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.timer_sharp), onPressed:()=>getTime(), color: Colors.white,),
                      Text(timeDate.getTimeFromDateTime(_time), style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pin Notification",style: TextStyle(color: Colors.white),),
                    SizedBox(width: 15.0,),
                    Switch(value: isRemind, onChanged: (ch){
                      setState(() {
                        isRemind = ch;
                      });
                    }),
                  ],
                ),
                MaterialButton(
                  color: Colors.black12,
                  height: 50.0,
                  minWidth: 200.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  child: Text("Save",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Provider.of<TaskData>(context,listen: false).addTask(Task(_taskNameController.text,_taskDescriptionController.text,_time,isRemind,false));
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
