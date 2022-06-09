import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {

  static const String id =  'login_screen';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String  email = '';
  String  password= '';
  final _auth = FirebaseAuth.instance;
bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
             child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                         child: Image.asset('images/logo.png')
            ),
                      ),
                    ),
                   const SizedBox(
              height: 48,
            ),
                   TextField(
                       keyboardType: TextInputType.emailAddress,
                       style: const TextStyle(color: Colors.black),
                       textAlign: TextAlign.center,
              onChanged: (value){
                 email= value;
              },
              decoration:  kTextFieldDecoration.copyWith(
                hintText: 'Enter your Email'
              )
            ),
                   const SizedBox(
              height: 12,
            ),
                  TextField(
                   obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
              onChanged: (value){
               password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your Password'
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
                onPressed: ( ) async {
                setState(() {
                  showSpinner = true;
                });
                  try{
                 var newUser = await _auth.signInWithEmailAndPassword(
                     email: email, password: password);
                 if (newUser != null){
                   Navigator.pushNamed(context, ChatScreen.id);
                 }
                 setState(() {
                   showSpinner = false;
                 });
                  }
                      catch(e){
                    print (e);
                      }
                },
                minWidth:200,
                height: 42.0,
                             child: Text('Log In', ),
              ),
            ),
          ],
        ),
    ),
      )
    );
  }
}
