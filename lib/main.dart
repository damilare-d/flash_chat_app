import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_app/firebase_options.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flash_chat_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main  ( ) async {
 WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(options:
 DefaultFirebaseOptions.currentPlatform);

runApp(const FlashChat( ));
}


class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54)
        )
      ),
      initialRoute: WelcomeScreen.id ,
      routes: {
        '/' :(context) => WelcomeScreen(),
        'login_screen' :(context) => LoginScreen(),
        RegistrationScreen.id :(context) => RegistrationScreen(),
        ChatScreen.id :(context) => ChatScreen(),

      },
    );
  }
}
