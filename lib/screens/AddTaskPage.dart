import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();

  Task task = Task("01","","",false);
  bool forUpdate = false;

  AddTaskForm({this.forUpdate,this.task});

}

class _AddTaskFormState extends State<AddTaskForm> {

  String taskName = "",taskDes = "";


  // Widget buildChip(String label,int index){
  //   return InputChip(
  //     onPressed: (){
  //       setState(() {
  //         selectedDays[index] = !selectedDays[index];
  //       });
  //     },
  //     label: Text(label,style: TextStyle(color: Colors.black,),),
  //     backgroundColor: selectedDays[index]?Colors.grey:Colors.grey[300],
  //     shadowColor: Colors.grey,
  //     padding: EdgeInsets.all(4.0),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Center(child: Text("Add Task "),heightFactor:3.0,),
            TextFormField(
              initialValue: widget.task.taskName,
              maxLines: 1,
              onChanged: (value){
                setState(() {
                  taskName = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Name @required",
                labelText: "Task Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  gapPadding: 12.0,
                )
              ),
            ),
            SizedBox(height: 15.0,),
            TextFormField(
             initialValue: widget.task.taskDescription,
              onChanged: (value){
               taskDes = value;
              },
              decoration: InputDecoration(
                  hintText: "optional",
                  labelText: "Task Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    gapPadding: 12.0,
                  )
              ),
            ),
            Builder(
              builder:(ctx)=> OutlinedButton(
                child: Text("Save",),
                  onPressed: () {
                    if (taskName.isEmpty) {
                      Scaffold.of(ctx).showSnackBar(
                        SnackBar(
                          content: Text("Task Name can't be Empty !"),),);
                    }
                    else {
                      if(widget.forUpdate == true){
                        Provider.of<TaskData>(context,listen: false).updateTask(Task(widget.task.UID,taskName,taskDes,false));
                      }else{
                        Provider.of<TaskData>(context,listen:false).addTask(Task(DateTime.now().toIso8601String(),taskName,taskDes,false));
                      }
                      Navigator.pop(context);
                    }
                  }
                  ),
            )
          ],
        ),
      ),
    );
  }
}
