import 'package:flutter/material.dart';

class SettingSupportScreen extends StatelessWidget {
  const SettingSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: const Center(
        child: Text(
          'Support',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
