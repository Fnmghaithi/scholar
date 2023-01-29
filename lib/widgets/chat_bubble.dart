import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 32,
          bottom: 32,
          right: 32,
        ),
        // alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
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
      ),
    );
  }
}
