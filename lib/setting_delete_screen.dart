import 'package:flutter/material.dart';

class SettingDeleteScreen extends StatelessWidget {
  const SettingDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete'),
      ),
      body: const Center(
        child: Text(
          'Delete',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
