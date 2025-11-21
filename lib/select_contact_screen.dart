import 'package:flutter/material.dart';
import 'package:my_app/model/chat_model.dart';

class SelectContactScreen extends StatelessWidget {
  final Function(ChatModel) onNewChat;

  const SelectContactScreen({super.key, required this.onNewChat});

  @override
  Widget build(BuildContext context) {
    final contacts = {
      "User 4": "https://randomuser.me/api/portraits/men/1.jpg",
      "User 5": "https://randomuser.me/api/portraits/women/2.jpg",
      "User 6": "https://randomuser.me/api/portraits/men/3.jpg",
      "User 7": "https://randomuser.me/api/portraits/women/4.jpg",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select contact"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final name = contacts.keys.elementAt(index);
          final imgPath = contacts.values.elementAt(index);

          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(imgPath)),
            title: Text(name),
            onTap: () {
              final newChat = ChatModel(
                name: name,
                message: "",
                time: "",
                imgPath: imgPath,
              );
              onNewChat(newChat);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
