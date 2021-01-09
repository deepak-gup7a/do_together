import 'package:flutter/material.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();


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
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
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
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
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
                    IconButton(icon: Icon(Icons.date_range), onPressed:()=>getDate()),
                    Text(_date),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.timer_sharp), onPressed:()=>getTime()),
                    Text(_time),
                  ],
                ),
              ),
              MaterialButton(
                child: Text("Save"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
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
    ));
  }
}
