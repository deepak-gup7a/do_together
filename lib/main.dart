import 'package:do_together/models/task_data.dart';
import 'package:do_together/screens/AddTaskPage.dart';
import 'package:do_together/screens/login_page.dart';
import 'package:do_together/screens/main_page.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:do_together/utills/custom_delegate_for_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/task.dart';
import 'screens/Home.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>TaskData() ),
        Provider(create: (_)=>AuthService(FirebaseAuth.instance)),
        StreamProvider(create: (context)=>context.read<AuthService>().authChange)
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:AuthenticationWrapper(),
      ),
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null){
      return MainPage();
    }
    return LoginPage();
  }
}
