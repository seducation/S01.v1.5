import 'package:flutter/material.dart';
import 'package:myapp/cnm_add_tabscreen.dart';
import 'package:myapp/cnm_calls_tabscreen.dart';
import 'package:myapp/cnm_chats_tabscreen.dart';
import 'package:myapp/cnm_meeting_tabscreen.dart';
import 'package:myapp/cnm_notifications_tabscreen.dart';
import 'package:myapp/contact_pop_up_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          title: const Text('myapps'),
          actions: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Messages"),
              Tab(text: "Activity"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MessagesCategoryTab(),
            ActivityCategoryTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF65a9e0),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const FindContactDialog(),
            );
          },
          child: const Icon(Icons.create, color: Colors.white),
        ),
      ),
    );
  }
}

class MessagesCategoryTab extends StatelessWidget {
  const MessagesCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.chat), text: "Chats"),
            Tab(icon: Icon(Icons.notifications), text: "Notifications"),
          ],
        ),
        body: const TabBarView(
          children: [
            CNMChatsTabscreen(),
            CNMNotificationsTabscreen(),
          ],
        ),
      ),
    );
  }
}

class ActivityCategoryTab extends StatelessWidget {
  const ActivityCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.call), text: "Calls"),
            Tab(icon: Icon(Icons.add), text: "Add"),
            Tab(icon: Icon(Icons.meeting_room), text: "Meeting"),
          ],
        ),
        body: const TabBarView(
          children: [
            CNMCallsTabscreen(),
            CNMAddTabscreen(),
            CNMMeetingTabscreen(),
          ],
        ),
      ),
    );
  }
}
