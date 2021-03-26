import 'package:do_together/models/User.dart';
import 'package:do_together/screens/loading_widget.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {

    user userDetail = AuthService().getUserDetails();
    return (userDetail==null)
        ?Center(child: Text("please sign in"),)
        :Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()async{
                await AuthService().signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    child: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text("${userDetail.name}"),
                SizedBox(height: 20.0,),
                Text("${userDetail.emailId}")
              ],
            )
          ),
        ),
      ),
    );
  }
}
