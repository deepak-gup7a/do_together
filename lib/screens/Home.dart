
import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/screens/task_list_page.dart';
import 'package:do_together/utills/custom_delegate_for_search.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            context: context,
            builder: (context) => AddTaskForm(
              task: Task("01","","",false),
              forUpdate: false,
            ),
          );
        },
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin:EdgeInsets.all(20.0),child: Text("January 2021",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              Container(margin:EdgeInsets.symmetric(horizontal: 20.0),child: Text("Today's To-Do ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),),
              Container(margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey)]
              ),),
              Expanded(child: SingleChildScrollView(
                child: TaskListPage(),
              ))
          ]
        ),
      ),
    );

  }
}


