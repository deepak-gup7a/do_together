
import 'package:do_together/services/Authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: emailController,
              ),
              TextField(
                controller: passController,
              ),
              RaisedButton(
                  onPressed:(){
                    context.read<AuthService>().signIn(email: emailController.text,pass: passController.text);
              })
            ],
          ),
        ),
      ),
    );
  }
}
