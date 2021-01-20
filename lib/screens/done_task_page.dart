import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task>doneTask = Provider.of<TaskData>(context).getDoneTasks();
    return Scaffold(
      body: doneTask.length==0?Center(child: Text("Nothing Done ☺"),):Container(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: doneTask.length,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text("${index+1}. ${doneTask[index].taskName}",style: TextStyle(fontSize: 25.0),),
            );
          },
        ),
      ),
    );
  }
}
