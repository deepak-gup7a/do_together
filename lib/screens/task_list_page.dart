import 'dart:ui';
import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import 'AddTaskPage.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    List<Task> _tasks = Provider.of<TaskData>(context).getTasks();
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _tasks.length,
        itemBuilder: (lContext, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal:12.0,vertical: 8.0),
            dense: true,
            enableFeedback: true,
            trailing: PopupMenuButton(
              tooltip: "more options",
              itemBuilder: (BuildContext pContext) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    child: MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Delete"),
                      onPressed: () {
                        Navigator.pop(pContext);
                        showDialog(
                            context: context,
                            builder: (dContext){
                          return Dialog(
                            elevation: 5.0,
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Are you sure !",style: TextStyle(fontSize: 25.0),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MaterialButton(onPressed: (){
                                        Provider.of<TaskData>(context,listen: false).deleteTask(_tasks[index]);
                                        Navigator.pop(dContext);
                                      },child: Text("Yes"),),
                                      MaterialButton(onPressed: (){
                                        Navigator.pop(dContext);
                                      },child: Text("No"),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: MaterialButton(
                        child: Text("Edit"),
                        onPressed: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0)),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (context) => AddTaskForm(
                              task: _tasks[index],
                              forUpdate: true,
                            ),
                          );
                        }),
                  )
                ];
              },
            ),
            leading: Checkbox(
              value: _tasks[index].isDone,
              onChanged: (bool value) {
                setState(() {
                  Provider.of<TaskData>(context, listen: false).doneTask(_tasks[index]);
                });
              },
            ),
            title: Text(
              _tasks[index].taskName,
              style: TextStyle(
                  decoration: _tasks[index].isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                 // color: Colors.white,
                  fontSize: 24.0),
            ),
            //subtitle: Text(_tasks[index].taskDescription),
          );
        },
      ),
    );
  }
}
