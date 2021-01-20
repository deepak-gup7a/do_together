import 'package:do_together/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          // theme: ThemeData(
          //   //primarySwatch: Colors.black87,
          //   bottomSheetTheme: BottomSheetThemeData(
          //       backgroundColor: Colors.black.withOpacity(0)),
          // ),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Home()
      ),
    );
  }
}
