
import 'package:do_together/screens/loading_widget.dart';
import 'package:do_together/services/Authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {

  final Function tv;
  SignupPage({this.tv});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading?Loading():SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do Together Sign up",style: TextStyle(fontSize: 35.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  SizedBox(height: 40.0,),

                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: "user name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: Icon(Icons.person)
                    ),
                    validator: (val){
                      if(val.isNotEmpty)
                        return null;
                      return "please enter user name";
                    },
                  ),

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
                      label: Text("sign up"),
                      onPressed:()async{
                        if(_formKey.currentState.validate())
                          setState(() {
                            _loading = true;
                          });
                          dynamic res = await AuthService().signUp(email: emailController.text,pass: passController.text,name: userNameController.text);
                          if(res==null){
                            setState(() {
                              _loading = false;
                            });
                          }

                    }),
                  TextButton(
                      onPressed: (){
                        widget.tv();
                      }, child: Text("already have an account ?",style: TextStyle(fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
