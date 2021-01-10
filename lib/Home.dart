import 'package:flutter/material.dart';

import 'AddTaskPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Center(
            child: Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'D0 Together',
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
      body: Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
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
              new Container(
                height: 100.0,
                width: 200.0,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.blue,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),

                        )
                    ),
                    child: new Center(
                      child: new Text(
                        'TASK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.white.withOpacity(1.0),
                          //height: 2.0,
                          fontSize: 40.0,
                        ),
                        //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
                      ),
                    )
                ),
              ),
            ],
          ),
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