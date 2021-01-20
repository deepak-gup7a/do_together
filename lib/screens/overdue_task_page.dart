import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverDueTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task>overdueTask = Provider.of<TaskData>(context).getOverdueTasks();
    return Scaffold(
      body: overdueTask.length==0?Center(child: Text("Nothing overdue ☺"),):Container(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: overdueTask.length,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text("${index+1}. ${overdueTask[index].taskName}",style: TextStyle(fontSize: 25.0),),
            );
          },
        ),
      ),
    );
  }
}
