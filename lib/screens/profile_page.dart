import 'package:do_together/screens/loading_widget.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading?Loading():Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(child: Text("Log out"),
              onPressed: ()async{
            setState(() {
              _loading = true;
            });
            dynamic res = await AuthService().signOut();
            if(res == null){
              _loading = false;
            }
          },),
        ),
      ),
    );
  }
}
