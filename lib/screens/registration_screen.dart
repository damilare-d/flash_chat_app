import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 final _auth = FirebaseAuth.instance;
  String  email= '';
  String  password= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200,
                  child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              onChanged: (value){
                email = value;
              },
                decoration:  kTextField2Decoration.copyWith(
                    hintText: 'Enter your mail.'
                )
            ),
           const SizedBox(
              height: 12,
            ),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              onChanged: (value){
                password = value;
              },
              decoration:  kTextField2Decoration.copyWith(
                hintText: 'Enter your password.'
              )
            ),
            const SizedBox(
               height: 24,
             ),
             RoundedButton(
               //todo :the onpresssed button needs to work  and take me to the chatscreen
               colour: Colors.blueAccent,
               title: 'Register',
                onPressed: ( ) async {
                  try {
                    var newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  }
                  catch (e) {
                    print(e);
                  }
                  Navigator.pushNamed(context, ChatScreen.id);
                }
              ),
          ],
        ),
      ),
    );
  }
}
