import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/utills/TimeDate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Task>_tasks = Provider.of<TaskData>(context).getTasks();

    return Container(
      child: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context,index){
          return Card(
            color:  _tasks[index].remindOrNot?Colors.green:Colors.yellow,
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal:0.0,vertical: 02.0),
            child: ListTile(
              title: Text(_tasks[index].taskName),
              subtitle: Text(_tasks[index].taskDescription),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(TimeDate().getDateFromDateTime(_tasks[index].taskDeadline)),
                  Text(TimeDate().getTimeFromDateTime(_tasks[index].remindTime))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
