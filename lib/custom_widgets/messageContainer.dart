import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  MessageContainer({
    required this.messageText,
    required this.messageSender,
    required this.isMe,
  });
  final String messageText, messageSender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    print("Ali:: isMe = $isMe");
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              messageSender,
              style: const TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          Material(
            elevation: 10,
            shadowColor: Colors.deepPurple,
            borderRadius: isMe
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
            color: isMe == true ? Colors.deepPurple[200] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                ' $messageText',
                style: TextStyle(
                  fontSize: 18,
                  color: isMe ? Colors.white : Colors.deepPurple[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
