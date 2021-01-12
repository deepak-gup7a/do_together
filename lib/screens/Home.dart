import 'package:do_together/models/task.dart';
import 'package:do_together/models/task_data.dart';
import 'package:do_together/screens/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTaskPage.dart';
import 'empty_list_page.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    int taskListLength = Provider.of<TaskData>(context).getTaskCount();
    if(taskListLength == 0)
    Provider.of<TaskData>(context).fetchTaskFromDatabase();

    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Center(
            child: Stack(
              children: <Widget>[
                // Stroked text as border.
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
                // Solid text as fill.
                Text(
                  'Do Together',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            )
            ),
      ),
      body: Container(
        child: taskListLength == 0?EmptyList():TaskListPage(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTaskForm();
          }));
        },
      ),
    );
  }
}
//



// Text(
// 'Greetings, planet!',
// style: TextStyle(
// fontSize: 40,
// foreground: Paint()
// ..shader = ui.Gradient.linear(
// const Offset(0, 20),
// const Offset(150, 20),
// <Color>[
// Colors.red,
// Colors.yellow,
// ],
// )
// ),
// )

// Container(
//   height: 80.0,
//   width: 200.0,
//   color: Colors.blueGrey,
//   child: Center(
//     child: Text(
//       'TASK',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontStyle: FontStyle.normal,
//         color: Colors.white.withOpacity(1.0),
//         //height: 2.0,
//         fontSize: 40.0,
//       ),
//       //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
//     ),
//   ),
// ),