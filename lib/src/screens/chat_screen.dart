import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project_with_firebase/src/auth.dart';
import 'package:first_project_with_firebase/src/constants/constants.dart';
import 'package:first_project_with_firebase/src/widgets/message_buble_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  User? loggedUser;
  String message = '';
  final firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    loggedUser = Auth().currentUser;
  }

  // void getMessage() async {
  // gọi 1 lần là gọi hết
  //   final messages = await firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  // void messageStream() async {
  //   // khi có sự thay đổi thì gọi
  //   await for (var snapshot in firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // messageStream();
                Auth().signOut();
                Navigator.of(context).pop();
              }),
        ],
        centerTitle: true,
        title: Text('⚡️${loggedUser!.email}'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            messageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageController.clear();
                      firestore
                          .collection('messages')
                          .add({'sender': loggedUser!.email, 'text': message, 'time': DateTime.now()});
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageStream() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy("time", descending: false).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs.reversed;
          List<MessageBuble> messageBubles = [];
          for (var message in messages) {
            if (message.data() != null) {
              final messageMap = message.data() as Map;
              final messageText = messageMap['text'];
              final messageSender = messageMap['sender'];

              final currentUser = loggedUser!.email;
              bool isMe = false;
              if (currentUser == messageSender) {
                isMe = true;
              }

              final messageBuble = MessageBuble(
                message: messageText,
                sender: messageSender,
                isMe: isMe,
              );

              // final messageSender = message.data()['sender'];
              messageBubles.add(messageBuble);
            }
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageBubles,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        }
        return Container(color: Colors.red);
      },
    );
  }
}
