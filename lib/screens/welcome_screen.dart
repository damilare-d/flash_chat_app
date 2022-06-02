import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {

  static String id ='Welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState( );
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController ? controller;
  Animation ? animation;


  @override
  void initState( ) {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_){
    controller = AnimationController(
      duration: Duration(seconds:1),
        vsync: this,
      upperBound: 100
    );

 //   animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller!);

    controller?.forward( );

    //to make the animation go back and forth
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed){
    //     controller.forward( );
    //   }
    // });

    controller?.addListener(() {
      setState(() {
      });
       print(animation?.value);
    });
  });
    }

  @override
  void dispose( ) {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
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
                 AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText( 'Flash Chat',  textStyle: const TextStyle(
              color: Colors.black, fontSize: 45.0,
              fontWeight: FontWeight.w900,) ,
                 ),
             ],
            ),
          ],
           ),
           const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log in',
              colour: Colors.blueAccent,
              onPressed: ( ){
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
    )
    );
  }
}
