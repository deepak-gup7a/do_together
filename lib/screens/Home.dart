
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
    return Container(
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
    );

  }
}




// appBar: AppBar(
// centerTitle: true,
// // backgroundColor: Colors.black12,
// toolbarHeight: 75.0,
// title: Stack(
// children: <Widget>[
// Text(
// 'Do Together',
// style: TextStyle(
// fontSize: 40,
// foreground: Paint()
// ..style = PaintingStyle.stroke
// ..strokeWidth = 3
// ..color = Colors.blue[700],
// ),
// ),
// Text(
// 'Do Together',
// style: TextStyle(
// fontSize: 40,
// color: Colors.grey[300],
// ),
// ),
// ],
// ),
// ),