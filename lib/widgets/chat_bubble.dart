import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
      ),
      alignment: Alignment.centerLeft,
      height: 65,
      width: 150,
      margin: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: const Text(
        'I am a new user',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
