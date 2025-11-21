import 'package:flutter/material.dart';

class SelectContactScreen extends StatelessWidget {
  const SelectContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Select contact"),
            Text(
              "256 contacts",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white70,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          
          // Static Action Items
          const ActionItem(
            icon: Icons.group,
            label: "New group",
          ),
          const ActionItem(
            icon: Icons.person_add,
            label: "New contact",
            trailingIcon: Icons.qr_code,
          ),
          const ActionItem(
            icon: Icons.groups,
            label: "New community",
          ),
          const ActionItem(
            icon: Icons.smart_toy_outlined,
            label: "Chat with AIs",
          ),

          // Section Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Contacts on WhatsApp",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),

          // Contact Items
          const ContactItem(
            name: "Baby (You)",
            status: "Message yourself",
            imageAsset: "assets/baby.jpg", // Placeholder logic handles missing asset
            isMe: true,
          ),
          const ContactItem(
            name: "Alice",
            status: "Busy",
            avatarColor: Colors.brown,
            initials: "A",
          ),
          const ContactItem(
            name: "Alex Smith",
            status: "At the gym",
            avatarColor: Colors.blueGrey,
            initials: "A",
          ),
          const ContactItem(
            name: "Andrew",
            status: "Urgent calls only",
            avatarColor: Colors.orangeAccent,
            initials: "A",
          ),
          const ContactItem(
            name: "Mom",
            status: "Hey there! I am using WhatsApp.",
            avatarColor: Colors.purple,
            initials: "M",
          ),
           const ContactItem(
            name: "John Doe",
            status: "Battery about to die",
            avatarColor: Colors.teal,
            initials: "J",
          ),
        ],
      ),
    );
  }
}

// Widget for the top action buttons (New Group, New Contact, etc.)
class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData? trailingIcon;

  const ActionItem({
    super.key,
    required this.icon,
    required this.label,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xFF00A884), // WhatsApp Green
        child: Icon(
          icon,
          color: const Color(0xFF111B21), // Dark icon color
          size: 24,
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: trailingIcon != null
          ? Icon(trailingIcon, color: Colors.grey)
          : null,
    );
  }
}

// Widget for individual contacts
class ContactItem extends StatelessWidget {
  final String name;
  final String? status;
  final String? imageAsset;
  final Color? avatarColor;
  final String? initials;
  final bool isMe;

  const ContactItem({
    super.key,
    required this.name,
    this.status,
    this.imageAsset,
    this.avatarColor,
    this.initials,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: avatarColor ?? Colors.grey[800],
        backgroundImage: imageAsset != null ? AssetImage(imageAsset!) : null,
        child: imageAsset == null
            ? Text(
                initials ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            : null,
      ),
      title: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isMe) ...[
            const SizedBox(width: 4),
          ]
        ],
      ),
      subtitle: status != null
          ? Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                status!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : null,
    );
  }
}