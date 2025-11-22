import 'package:flutter/material.dart';

class HelpHowToCreatePost extends StatelessWidget {
  const HelpHowToCreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Create a Post'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📸 1. Photo Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Only an Image\nIf you upload just an image, your post will be treated as a simple Photo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Image + Title\nWhen you add a title to your image, it stays a Photo Post, but with context for viewers.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '😄 2. Meme / Caption Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Image + Description\nUpload an image and add a description — it will be classified as a Meme or Caption Post, perfect for expressing humor, opinions, or storytelling.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '🖼️ 3. Photo Stories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Image + Title + Description\nWhen all three elements are present, your post becomes a Photo Story, ideal for sharing deeper moments or detailed updates.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '❓ 4. Question Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Only Title\nIf you enter only a title without an image or description, your post will be recognized as a Question, designed for quick replies and community answers.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '💬 5. Quote Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Only Description\nWriting only a description creates a Quote, perfect for thoughts, ideas, or short messages.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '✍️ 6. Text Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Title + Description (no image)\nIf you add both a title and a description without an image, it becomes a Text Post — clean, simple, and expressive.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '📁 7. File Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Any File + Optional Text\nUploading documents, audio, videos, or other files creates a File Post.\nAdd a title or description if you want to give more context.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
