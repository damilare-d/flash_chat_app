import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';


class WelcomeScreen extends StatefulWidget {

  static String id ='Welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Row(
             //mainAxisAlignment: MainAxisAlignment.spaceAround,
             children : [
                    Hero(
                      tag: 'logo',
                      child: Container(
                          child: Image.asset('images/logo.png'),
                          height: 60,
                                  ),
                    ),
                         const Text  (
                         'Flash Chat',
                style: TextStyle(
                  color: Colors.black,
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                            ),
                         )
             ],
            ),
           const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color:Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth:200 ,
                  height: 42.0,
                  child: Text('Log In', ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color:Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  onPressed: (){
                   Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth:200 ,
                  height: 42.0,
                  child: Text('Register', ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
