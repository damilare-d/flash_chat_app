import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
