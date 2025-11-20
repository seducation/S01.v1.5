import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Defines the overall light theme for the application.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Row UI',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[100], // Very light grey background
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF5265C), // The prominent pink accent color
          surface: Colors.white, // White surface for cards/dialogs
          onSurface: Colors.black87,
          onPrimary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 1,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
          labelLarge: TextStyle(color: Colors.black87),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF5265C),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          onPressed: () {
            // Shows the custom dialog when the button is pressed.
            showDialog(
              context: context,
              builder: (context) => const CreateRowDialog(),
            );
          },
          child: const Text("Open Create Row Popup"),
        ),
      ),
    );
  }
}

// The main dialog widget that contains the form.
class CreateRowDialog extends StatefulWidget {
  const CreateRowDialog({super.key});

  @override
  State<CreateRowDialog> createState() => _CreateRowDialogState();
}

class _CreateRowDialogState extends State<CreateRowDialog> {
  // State for the "Create more" toggle switch.
  bool _createMore = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Dialog(
          // White background for the dialog body.
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            width: 500, // Max width for tablet/desktop
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
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
                        "Create row",
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

                // --- Scrollable Form Content ---
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // Input fields using the custom widget
                        CustomNullTextField(
                          label: "title",
                          hintText: "Enter string",
                          maxLength: 256,
                          minLines: 3,
                          icon: Icons.title,
                        ),
                        SizedBox(height: 24),

                        CustomNullTextField(
                          label: "description",
                          hintText: "Enter string",
                          maxLength: 1000,
                          minLines: 3,
                          icon: Icons.title,
                        ),
                        SizedBox(height: 24),

                        CustomNullTextField(
                          label: "imageUrl",
                          hintText: "Enter URL",
                          isSingleLine: true,
                          icon: Icons.link,
                        ),
                        SizedBox(height: 24),

                        // Row ID Button/Label
                        RowIdButton(),
                        SizedBox(height: 24),

                        // Permission Text
                        Text(
                          "Choose which permission scopes to grant your application. It is best practice to allow only the permissions you need to meet your project goals.",
                          style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.4),
                        ),
                        SizedBox(height: 16),

                        // Info Box
                        InfoBox(),
                      ],
                    ),
                  ),
                ),

                const Divider(height: 1, color: Colors.grey),

                // --- Footer Section (Toggle and Buttons) ---
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Create More Switch
                      Row(
                        children: [
                          Switch(
                            value: _createMore,
                            activeThumbColor: Theme.of(context).colorScheme.primary, // Pink accent
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey.shade300,
                            onChanged: (val) => setState(() => _createMore = val),
                          ),
                          const SizedBox(width: 8),
                          const Text("Create more", style: TextStyle(color: Colors.black87, fontSize: 13)),
                        ],
                      ),
                      const Spacer(),

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

                      // Create Button
                      ElevatedButton(
                        onPressed: () {
                          // In a real app, this would submit the form data
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Row Created!")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF5265C), // Pink color
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        child: const Text("Create", style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// --- Auxiliary Widgets for Clarity ---

class RowIdButton extends StatelessWidget {
  const RowIdButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.edit, size: 14, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Text("Row ID", style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50, // Light blue background
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "If you want to assign row permissions, navigate to Table settings and enable row security. Otherwise, only table permissions will be used.",
              style: TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Reusable Custom Input Field with NULL Checkbox and Counter ---
class CustomNullTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final int? maxLength;
  final int minLines;
  final bool isSingleLine;
  final IconData icon;

  const CustomNullTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLength,
    this.minLines = 1,
    this.isSingleLine = false,
    required this.icon,
  });

  @override
  State<CustomNullTextField> createState() => _CustomNullTextFieldState();
}

class _CustomNullTextFieldState extends State<CustomNullTextField> {
  bool isNull = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Row (title optional)
        Row(
          children: [
            Icon(widget.icon, size: 14, color: Colors.grey.shade600),
            const SizedBox(width: 6),
            RichText(
              text: TextSpan(
                text: widget.label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
                children: const [
                  TextSpan(
                    text: " optional",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Input Container with Counter and NULL Checkbox
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50, // Input background
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller,
                enabled: !isNull, // Disable input if NULL is checked
                maxLines: widget.isSingleLine ? 1 : widget.minLines,
                maxLength: widget.maxLength,
                style: TextStyle(
                  color: isNull ? Colors.grey : Colors.black87,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12),
                  counterText: "", // Hide default counter provided by maxLength
                ),
              ),

              // Footer inside the input box (Counter + Null Checkbox)
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 8, bottom: 4),
                child: Row(
                  children: [
                    // Custom Counter
                    if (widget.maxLength != null)
                      ValueListenableBuilder(
                        valueListenable: _controller,
                        builder: (context, TextEditingValue value, _) {
                          return Text(
                            "${value.text.length}/${widget.maxLength}",
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        },
                      ),
                    const Spacer(),
                    // Null Checkbox
                    InkWell(
                      onTap: () {
                        setState(() {
                          isNull = !isNull;
                          if (isNull) _controller.clear();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isNull,
                            onChanged: (val) {
                              setState(() {
                                isNull = val ?? false;
                                if (isNull) _controller.clear();
                              });
                            },
                            side: BorderSide(color: Colors.grey.shade400, width: 1),
                            activeColor: Colors.black, // Dark checkmark box
                            checkColor: Colors.white,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text(
                            "NULL",
                            style: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
