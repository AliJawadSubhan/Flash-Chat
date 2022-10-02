// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/custom_widgets/messageContainer.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
User? loggedInUser;

class MessageStream extends StatefulWidget {
  MessageStream({Key? key}) : super(key: key);

  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  final firestore = FirebaseFirestore.instance;
  User? usera;

  void cz() async {
    final user = await auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser!.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data?.docs.reversed;

        cz();

        List<MessageContainer> messageWidgets = [];
        for (var message in messages!) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          final messages = snapshot.data?.docs.reversed;
          final currentUser = loggedInUser?.email;
          print("Ali log:: $messageSender ");
          var messageContainer = MessageContainer(
            messageText: messageText,
            messageSender: messageSender,
            isMe: currentUser == messageSender,
          );
          final messageeWidget = messageContainer;

          messageWidgets.add(messageeWidget);
        }
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            shrinkWrap: true,
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
