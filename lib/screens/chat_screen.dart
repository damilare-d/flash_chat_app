import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';


final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages').snapshots();
var loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController  = TextEditingController();
  String ? messageText;
   final _firestore = FirebaseFirestore.instance;
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
                _auth.signOut();
                Navigator.pop(context);
              },
           icon: Icon(Icons.close),
          ),
        ],
        title: Text('chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
     backgroundColor: Colors.white,
     resizeToAvoidBottomInset: true,
     body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: MessageStream( )),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                          color: Colors.black
                      ),
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    // onPressed:
                    //Implement send functionality.
                    // sendMessage,
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser,
                      });
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),

            )
          ],
        ),
        ),
      );
  }
}


class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot>  (
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData ){
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages =snapshot.requireData.docs.reversed;
        List <MessageBubble> messageBubbles = [];
        for (var message in messages){
          final messageText = message['text'] ?? "";
          final messageSender = message['sender'] ?? "";

          final currentUser = loggedInUser;

          print(messageText);
          final messageBubble = MessageBubble(
              sender:messageSender,
              text:messageText,
            isMe: messageSender == currentUser,
          );

          messageBubbles.add(messageBubble);
          // print(messageWidgets);
        }
        return ListView(
          reverse: true,
          padding:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: messageBubbles,
        );
      },
    );
  }
}


class MessageBubble extends StatelessWidget {
 final String  sender;
 final String  text;
final bool  isMe ;

    const MessageBubble ({ required this.sender,  required this.text , required this.isMe}) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$sender', style: TextStyle(color: Colors.black54, fontSize: 15.0),),
          Material(
            borderRadius: isMe ?  const BorderRadius.only(
                topLeft: Radius.circular(30)
                ,bottomLeft:Radius.circular(30),
                bottomRight: Radius.circular(30)
            ) : const BorderRadius.only(
                topRight: Radius.circular(30)
                ,bottomLeft:Radius.circular(30),
                bottomRight: Radius.circular(30)
            ),
           elevation: 5.0,
           color:  isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Text(
              '$text ',
                style:  TextStyle(
                  color: isMe ? Colors.white: Colors.black54,
                  fontSize:15,
),),
            ),
          ),
        ],
      ),
    );
}
}
