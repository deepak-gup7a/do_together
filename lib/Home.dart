import 'package:do_together/empty_list.dart';
import 'package:do_together/task.dart';
import 'package:do_together/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTaskPage.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Task>_tasks = Provider.of<TaskData>(context).getTasks();
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
        child: _tasks.isEmpty?EmptyList():ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(_tasks[index].taskName),
              subtitle: Text(_tasks[index].taskDescription),
            );
          },
        ),
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