import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/profile');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.shield_outlined),
                      title: Text('App Permission'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode_outlined),
                      title: const Text('Dark Mode'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Dark Mode'),
                              content: RadioGroup<ThemeMode>(
                                groupValue: context.watch<ThemeModel>().themeMode,
                                onChanged: (value) {
                                  context.read<ThemeModel>().themeMode = value!;
                                  Navigator.of(context).pop();
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    RadioListTile<ThemeMode>(
                                      title: Text('Light'),
                                      value: ThemeMode.light,
                                    ),
                                    RadioListTile<ThemeMode>(
                                      title: Text('Dark'),
                                      value: ThemeMode.dark,
                                    ),
                                    RadioListTile<ThemeMode>(
                                      title: Text('System'),
                                      value: ThemeMode.system,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const ListTile(
                      leading: Icon(Icons.font_download_outlined),
                      title: Text('Font'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text('Location'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const ListTile(
                      leading: Icon(Icons.online_prediction_outlined),
                      title: Text('Active Status'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.privacy_tip_outlined),
                      title: Text('Privacy'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.safety_check_outlined),
                      title: Text('Safety'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.delete_outline),
                      title: Text('Delete'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.support_agent_outlined),
                      title: Text('Support'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.emergency_outlined),
                      title: Text('Emergency'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
