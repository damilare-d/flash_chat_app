import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth =  FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser ( ) async{
    try{
     String? user =  _auth.currentUser?.email;
    if (user != null ){
      user = _auth.currentUser?.email;
    } }
        catch (e){
      print (e);
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              onPressed: ( ) {
                //implement logout functionality,
              },
           icon: Icon(Icons.close),
          ),
        ],
        title: Text('chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
     body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(

            )
          ],
        ),
      )
    );
  }
}
