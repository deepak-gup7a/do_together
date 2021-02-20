import 'package:do_together/services/Authservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(child: Text("Log out"),
              onPressed: (){
            context.read<AuthService>().signOut();
          },),
        ),
      ),
    );
  }
}
