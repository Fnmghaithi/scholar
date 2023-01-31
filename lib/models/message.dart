import 'package:scholar_chat/constants.dart';

class Message {
  final String message;

  Message(this.message);

  factory Message.fromJson(dynamic jsonData) {
    return Message(jsonData[kMessageField]);
  }
}
