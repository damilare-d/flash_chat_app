import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {

  static const String id =  'login_screen';

  String email;
  String password;
  LoginScreen({})


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
           child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
                  Container(
                   child: Image.asset('images/logo.png')
          ),
                 const SizedBox(
            height: 48,
          ),
                 Container(
                   decoration: const BoxDecoration(
                     border: Border(
                      left: BorderSide(
                         color: Colors.lightBlueAccent
                       )
                     )
                   ),
                   child: TextField(
            onChanged: (value){
              //on pressed do something with user input
              email= value;
            },
            decoration:  kTextFieldDecoration.copyWith(
              hintText: 'Enter your Email'
            )
          ),
                 ),
                 const SizedBox(
            height: 12,
          ),
                TextField(
            onChanged: (value){
              //on pressed do something with user input
            },
            decoration: InputDecoration(
                hintText: 'Enter your mail',
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderSide:const BorderSide(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.circular(32),
                )
            ),
          ),
                const SizedBox(
            height: 24,
          ),
                Material(
            elevation: 5.0,
            color:Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30),
                    child: MaterialButton(
              onPressed: ( ){
                Navigator.pushNamed(context, LoginScreen.id);
              },
              minWidth:200,
              height: 42.0,
                           child: Text('Log In', ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
