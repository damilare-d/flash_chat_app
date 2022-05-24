import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              onChanged: (value){
                //do sth with the user input
              },
              decoration: InputDecoration(
                hintText:'Enter your mail',
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(32),
                )

            ),
            ),
           const SizedBox(
              height: 12,
            ),
            TextField(
              onChanged: (value){
                //do sth with the user input
              },
              decoration:  InputDecoration(
                  hintText:'Enter your mail',
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(32),
                  )

              ),
            ),
            const SizedBox(
               height: 24,
             ),
             Material(
              elevation: 5.0,
              color:Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
              child: MaterialButton(
                onPressed: (){
                //  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                minWidth:200 ,
                height: 42.0,
                child: const Text('Register', ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
