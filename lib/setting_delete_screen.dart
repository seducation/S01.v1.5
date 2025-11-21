import 'package:flutter/material.dart';

// The main screen for account deletion.
class SettingDeleteScreen extends StatelessWidget {
  const SettingDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Standard back navigation
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF5265C), // Use the pink color from the example
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          onPressed: () {
            // Shows the custom delete confirmation dialog.
            showDialog(
              context: context,
              builder: (context) => const DeleteAccountDialog(),
            );
          },
          child: const Text("Delete My Account"),
        ),
      ),
    );
  }
}

// The dialog widget for confirming account deletion.
class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(16),
      child: SizedBox(
        width: 500, // Max width
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- Header Section ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delete Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.grey),

            // --- Content ---
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Are you sure you want to permanently delete your account?",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "This action is irreversible. All your data will be permanently removed.",
                      style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 1, color: Colors.grey),

            // --- Footer Section (Buttons) ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Cancel Button
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black54,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 12),

                  // Delete Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Account deletion process started.")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5265C), // Destructive action color
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: const Text("Delete", style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
