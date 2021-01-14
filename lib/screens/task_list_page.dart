import 'dart:ui';

import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {

    List<Task>_tasks = Provider.of<TaskData>(context).getTasks();
    bool isDone = false;

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Overdue : 0",style: TextStyle(color: Colors.red,fontSize: 20.0,fontWeight: FontWeight.bold),),
              Text("Done : 0",style: TextStyle(color: Colors.green,fontSize: 20.0,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        Container(
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _tasks.length,
          itemBuilder: (context,index){
            return Card(
              borderOnForeground: true,
              color:  Colors.grey[800],
              elevation: 5.0,
              margin: EdgeInsets.symmetric(horizontal:10.0,vertical: 5.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(12.0),
                dense: false,
                enableFeedback: true,
                trailing: IconButton(icon: Icon(Icons.more_vert,)
                  ,tooltip: "more options",
                onPressed: (){
                    Provider.of<TaskData>(context, listen: false).deleteTask(_tasks[index]);
                },),
                leading: Checkbox(value: isDone, onChanged: (bool value) {
                  setState(() {
                    isDone = value;
                    print(isDone);
                  });
                },
                ),
                title: Text(_tasks[index].taskName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.0),),
                //subtitle: Text(_tasks[index].taskDescription),
            ));
          },
        ),
          ),
      ],
    );
  }

}
