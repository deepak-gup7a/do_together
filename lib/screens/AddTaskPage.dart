import 'package:do_together/models/User.dart';
import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:do_together/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();

  Task task = Task("01","","",false);
  bool forUpdate ;

  AddTaskForm({this.forUpdate,this.task});

}

class _AddTaskFormState extends State<AddTaskForm> {

  String taskName ,taskDes ;
  final _formKey = GlobalKey<FormState>();
  DateTime dt = DateTime.now();
  user _user = AuthService().getUserDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  TextFormField(
                    initialValue: widget.task.taskName,
                    validator: (val){
                      if(val.isNotEmpty)
                        return null;
                      return "please add task name";
                    },
                    obscureText: false,
                    onChanged: (val){
                      setState(() {
                        taskName = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Task name",
                        isDense: false,

                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    initialValue: widget.task.taskDescription,
                    obscureText: false,
                    onChanged: (val){
                      setState(() {
                        taskDes = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Task description",
                        isDense: false,

                    ),
                  ),
                  SizedBox(height: 20.0,),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: Text("Save"),
                      onPressed: ()async{
                        if(_formKey.currentState.validate()){
                          Navigator.pop(context);
                          await DatabaseService(uid: _user.uid).updateUserTask(Task(
                              widget.forUpdate?(widget.task.UID):_user.uid+dt.toIso8601String(),
                              taskName??widget.task.taskName,
                              taskDes??widget.task.taskDescription,
                              false));
                        }
                      }
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
