import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/chat_messaging_screen.dart';
import 'package:my_app/one_time_message_screen.dart';
import 'package:shimmer/shimmer.dart';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final String imgPath;
  final bool isOnline;
  final int? messageCount;
  bool hasStory;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.imgPath,
    this.isOnline = false,
    this.messageCount,
    this.hasStory = false,
  });
}

class CNMChatsTabscreen extends StatefulWidget {
  const CNMChatsTabscreen({super.key});

  @override
  State<CNMChatsTabscreen> createState() => _CNMChatsTabscreenState();
}

class _CNMChatsTabscreenState extends State<CNMChatsTabscreen> {
  late List<ChatModel> chatItems;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    chatItems = [
      ChatModel(
        name: "John Doe",
        message: "Hello there!",
        time: "12:30 PM",
        imgPath: "https://picsum.photos/seed/p1/200/200",
        isOnline: true,
        messageCount: 2,
        hasStory: true,
      ),
      ChatModel(
        name: "Jane Doe",
        message: "How are you?",
        time: "12:35 PM",
        imgPath: "https://picsum.photos/seed/p2/200/200",
        hasStory: true,
      ),
      ChatModel(
        name: "Peter Jones",
        message: "See you soon.",
        time: "12:40 PM",
        imgPath: "https://picsum.photos/seed/p3/200/200",
        isOnline: true,
        messageCount: 1,
      ),
    ];
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  void _viewStory(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OneTimeMessageScreen(
          message: "This is a one-time message from ${chatItems[index].name}",
          onStoryViewed: () {
            if (mounted) {
              setState(() {
                chatItems[index].hasStory = false;
              });
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? _buildShimmerLoading()
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: StatusBar(chatItems: chatItems, onViewStory: _viewStory),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final chat = chatItems[index];
                      return ChatListItem(chat: chat, onTap: () => _viewStory(index));
                    },
                    childCount: chatItems.length,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => const ShimmerChatListItem(),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final List<ChatModel> chatItems;
  final Function(int) onViewStory;

  const StatusBar({super.key, required this.chatItems, required this.onViewStory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          final chat = chatItems[index];
          return GestureDetector(
            onTap: () => onViewStory(index),
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: chat.hasStory ? Colors.pinkAccent : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: CachedNetworkImageProvider(chat.imgPath),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    chat.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatListItem({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatMessagingScreen(
              imgPath: chat.imgPath,
              name: chat.name,
              time: chat.time,
              status: chat.isOnline ? "Online" : "Offline",
              message: chat.message,
            ),
          ),
        );
      },
      leading: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(chat.imgPath),
        ),
      ),
      title: Text(chat.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(chat.message, style: const TextStyle(color: Colors.grey)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(chat.time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 5),
          if (chat.messageCount != null && chat.messageCount! > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
              child: Text(
                chat.messageCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}

class ShimmerChatListItem extends StatelessWidget {
  const ShimmerChatListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(radius: 30, backgroundColor: Colors.white),
      title: SizedBox(height: 20, width: 150, child: ColoredBox(color: Colors.white)),
      subtitle: SizedBox(height: 15, width: 100, child: ColoredBox(color: Colors.white)),
    );
  }
}
