import 'package:flutter/material.dart';

import 'AddTaskPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Task'
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return AddTaskForm();
          }));
        },
      ),
    );
  }
}
