import 'package:do_together/models/task_data.dart';
import 'package:do_together/screens/AddTaskPage.dart';
import 'package:do_together/screens/login_page.dart';
import 'package:do_together/screens/main_page.dart';
import 'package:do_together/screens/sign_up_page.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:do_together/utills/custom_delegate_for_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/task.dart';
import 'screens/Home.dart';
import 'screens/login_page.dart';

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
        StreamProvider<User>.value(value:AuthService().authChange)
      ],
      child: MaterialApp(
        theme: ThemeData().copyWith(
          primaryColor: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home:AuthenticationWrapper(),
      ),
    );
  }
}


class AuthenticationWrapper extends StatefulWidget {

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool showSignup = true;

  void toggleView(){
    setState(() {
      showSignup = !showSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context);
    if(firebaseUser != null){
      return MainPage();
    }
    return showSignup? SignupPage(tv:toggleView):LoginPage(tv:toggleView);
  }
}
