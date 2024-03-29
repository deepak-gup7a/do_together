
import 'package:do_together/screens/loading_widget.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  final Function tv;
  LoginPage({this.tv});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool loading  = false;

  @override
  Widget build(BuildContext context) {
    return loading?Loading():SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do Together Log in",style: TextStyle(fontSize: 35.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "email ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      prefixIcon: Icon(Icons.email)
                    ),
                    validator: (val){
                      if(val.isNotEmpty)
                        return null;
                      return "please enter email";
                    },
                  ),
                  SizedBox(height: 12.0,),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    controller: passController,
                    decoration: InputDecoration(
                        hintText: "password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(icon:Icon(!_passwordVisible?Icons.visibility_off_outlined:Icons.visibility),
                      onPressed: (){
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      )
                    ),
                    validator: (val){
                      if(val.isNotEmpty)
                        return null;
                      return "please enter password";
                    },
                  ),
                  SizedBox(height: 12.0,),
                  // ignore: deprecated_member_use
                  RaisedButton.icon(
                      elevation: 5.0,
                    icon: Icon(Icons.login),
                      label: Text("log in"),
                      onPressed:()async{
                        if(_formKey.currentState.validate()){
                          setState(() {
                            loading = true;
                          });
                          dynamic res = await AuthService().signIn(email: emailController.text,pass: passController.text);
                        if(res == null){
                          setState(() {
                            loading = false;
                          });
                        }
                        }
                  }),
                  TextButton(
                      onPressed: (){
                        widget.tv();
                      }, child: Text("new user ?",style: TextStyle(fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
