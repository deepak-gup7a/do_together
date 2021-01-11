import 'package:do_together/task.dart';
import 'package:do_together/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();

  String _date = "12/12/1212";
  String _time="09:09";

  Future<void>getDate()async{
    final DateTime picked= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2030));
    if(picked!=null){
      setState(() {
        _date = picked.day.toString()+"/"+picked.month.toString()+"/"+picked.year.toString();
      });
    }
  }

  Future<void>getTime()async{
    final TimeOfDay picked = await showTimePicker(context: context, initialTime:TimeOfDay(hour: 00, minute: 00));
    if(picked!=null){
      setState(() {
        _time = picked.hour.toString()+":"+picked.minute.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _taskNameController,
            //    style: TextStyle(color: Colors.white),
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
                  prefixIcon: Icon(Icons.text_fields, color: Colors.white,),
                  labelText: "Task",
                  hintText: "Task Description",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Task description';
                  }
                  return null;
                },
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.date_range), onPressed:()=>getDate(), color: Colors.white,),
                    Text(
                        _date,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.timer_sharp), onPressed:()=>getTime(), color: Colors.white,),
                    Text(_time, style: TextStyle(color: Colors.white),),
                  ],
                ),
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
                    Provider.of<TaskData>(context,listen: false).addTask(Task(_taskNameController.text,_taskDescriptionController.text,DateTime.now(),true,DateTime.now()));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Processing")));
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
