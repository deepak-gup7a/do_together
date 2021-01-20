import 'dart:ui';
import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
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
        itemBuilder: (context, index) {
          return Card(
            borderOnForeground: true,
            // color:  Colors.grey[800],
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(12.0),
              dense: true,
              enableFeedback: true,
              trailing: PopupMenuButton(
                tooltip: "more options",
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      child: MaterialButton(
                        padding: EdgeInsets.all(0.0),
                        child: Text("Delete"),
                        onPressed: () {
                          Provider.of<TaskData>(context, listen: false)
                              .deleteTask(_tasks[index]);
                          Navigator.pop(context);
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
                            //Provider.of<TaskData>(context,listen:false).deleteTask(_tasks[index]);
                          }),
                    )
                  ];
                },
              ),
              leading: Checkbox(
                value: _tasks[index].isDone,
                onChanged: (bool value) {
                  setState(() {
                    _tasks[index].isDone = value;
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
                    color: Colors.white,
                    fontSize: 24.0),
              ),
              //subtitle: Text(_tasks[index].taskDescription),
            ),
          );
        },
      ),
    );
  }
}
