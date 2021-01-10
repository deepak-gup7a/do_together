import 'package:do_together/AddTaskPage.dart';
import 'package:do_together/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
      ),
    );
  }
}
