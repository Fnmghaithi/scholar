import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  List<Message> messagesList = [];

  void sendMessage({required String message, required String email}) async {
    await messages.add(
      {
        kMessageField: message,
        kCreatedAtField: DateTime.now(),
        'id': email,
      },
    );
  }

  void getMessages() {
    messages.orderBy(kCreatedAtField, descending: true).snapshots().listen(
      (event) {
        messagesList.clear();
        for (var doc in event.docs) {
          messagesList.add(Message.fromJson(doc));
        }
        emit(ChatSuccess(messages: messagesList));
      },
    );
  }
}
