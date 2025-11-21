import 'package:flutter/material.dart';

class ContactPopUpScreen extends StatelessWidget {
  const ContactPopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select contact"),
      ),
      body: const Center(
        child: Text("Contact Pop Up Screen"),
      ),
    );
  }
}
