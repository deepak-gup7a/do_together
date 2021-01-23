import 'package:do_together/models/task_data.dart';
import 'package:do_together/screens/AddTaskPage.dart';
import 'package:do_together/screens/main_page.dart';
import 'package:do_together/utills/custom_delegate_for_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/task.dart';
import 'screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MainPage(),
      ),
    );
  }
}
