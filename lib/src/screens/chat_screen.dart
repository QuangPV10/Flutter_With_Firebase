import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project_with_firebase/src/auth.dart';
import 'package:first_project_with_firebase/src/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  User? user;
  String message = '';
  final firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    user = Auth().currentUser;
  }

  // void getMessage() async {
  // gọi 1 lần là gọi hết
  //   final messages = await firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void messageStream() async {
    // khi có sự thay đổi thì gọi
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
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
                messageStream();
                // Auth().signOut();
                // Navigator.of(context).pop();
              }),
        ],
        centerTitle: true,
        title: Text('⚡️${user!.email}'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs;
                  List<Text> messageWidgets = [];
                  for (var message in messages) {
                    if (message.data() != null) {
                      final messageMap = message.data() as Map;
                      final messageText = messageMap['text'];
                      final messageSender = messageMap['sender'];

                      final messageWidget = Text('$messageText from $messageSender');

                      // final messageSender = message.data()['sender'];
                      messageWidgets.add(messageWidget);
                    }
                  }
                  return Column(
                    children: messageWidgets,
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                }
                return Container(color: Colors.red);
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      firestore.collection('messages').add({'sender': user!.email, 'text': message});
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
}
