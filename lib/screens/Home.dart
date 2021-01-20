import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/screens/done_task_page.dart';
import 'package:do_together/screens/overdue_task_page.dart';
import 'package:do_together/screens/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddTaskPage.dart';
import 'task_list_page.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    int overdueTaskCount = Provider.of<TaskData>(context).getOverdueTaskCount();
    int doneTaskCount = Provider.of<TaskData>(context).getDoneTaskCount();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       // backgroundColor: Colors.black12,
        toolbarHeight: 75.0,
        title: Stack(
          children: <Widget>[
            Text(
              'Do Together',
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.blue[700],
              ),
            ),
            Text(
              'Do Together',
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
      body: Container(
       // color: Colors.black87,
        //child: taskListLength == 0?EmptyList():TaskListPage(),
        child: TaskListPage(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
              context: context,
              builder: (context) => AddTaskForm(task:Task("","",DateTime.now(),false,false),forUpdate: false,),
          );
          }
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OverDueTaskPage())) ;
            },child: Text("Overdue : ${overdueTaskCount}",style: TextStyle(fontSize:20.0,color: Colors.redAccent),),),
            MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoneTaskPage()));
            },child: Text("Done : ${doneTaskCount}",style: TextStyle(fontSize:20.0,color: Colors.greenAccent),),)
          ],
        ),
      ),
    );

  }
}