import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart'; // Import the speech_to_text package

class RecordPage extends StatefulWidget {
  final String name;

  const RecordPage({super.key, required this.name});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final SpeechToText speechToText =
      SpeechToText(); // Create SpeechToText instance
  String kata = "Mengucapkan..."; // Initial text

  @override
  void initState() {
    super.initState();
    initializeSpeech();
  }

  void initializeSpeech() async {
    bool available = await speechToText.initialize();
    if (available) {
      startListening();
    }
  }

  void startListening() async {
    speechToText.listen(
      onResult: (result) {
        setState(() {
          kata = result.recognizedWords;
        });
      },
      listenFor:
          const Duration(minutes: 10), // Durasi maksimal untuk mendengarkan
      pauseFor: const Duration(
          seconds: 30), // Jeda sebelum menganggap tidak ada suara lagi
    );
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop(); // Stop listening when the page is disposed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Column(
          children: [
            Text(
              'Selamat datang, ${widget.name}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(kata), // Display the recognized speech
          ],
        ),
      ),
    );
  }
}
