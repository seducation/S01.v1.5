import 'package:flutter/material.dart';

class SettingPrivacyScreen extends StatelessWidget {
  const SettingPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
      ),
      body: const Center(
        child: Text(
          'Privacy',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
