import 'package:flutter/material.dart';

class SettingFontScreen extends StatelessWidget {
  const SettingFontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font'),
      ),
      body: const Center(
        child: Text(
          'Font',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
