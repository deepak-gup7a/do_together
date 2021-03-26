import 'dart:async';

import 'package:do_together/main.dart';
import 'package:do_together/screens/Home.dart';
import 'package:do_together/screens/login_page.dart';
import 'package:do_together/screens/main_page.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class EmailVerificationPage extends StatefulWidget {

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {

  bool verified = false;
  bool send = true;
  Timer _timer;
  String text = "Please verify your email address and login again";

  @override
  void initState() {
    super.initState();
    Future(() async {
      _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
        await FirebaseAuth.instance.currentUser..reload();
        var user = await FirebaseAuth.instance.currentUser;
        if (user.emailVerified) {
          setState((){
            verified = user.emailVerified;
          });
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    if (_timer != null) {
      _timer.cancel();
    }

  }
  @override
  Widget build(BuildContext context) {
    return verified?AuthenticationWrapper():Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            send?TextButton(onPressed: ()async{
              setState(() {
                send = false;
                text = "Verification link send";
              });
              await AuthService().sendEmailForVerification();
            },
                child:Text("Send email again "),
            ):SizedBox(width: 12.0,),
          ],
        ),
      ),
    );
  }
}
