import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget {
  final String message;
  final String sender;
  final bool isMe;
  const MessageBuble({required this.isMe, required this.message, required this.sender, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          sender,
          style: const TextStyle(fontSize: 13, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: isMe ? Colors.lightBlueAccent : Colors.purpleAccent),
          margin: const EdgeInsets.only(bottom: 13),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(message, textAlign: TextAlign.right, style: const TextStyle(fontSize: 15)),
          ),
        ),
      ],
    );
  }
}
