import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  // This variable holds the text we want to turn into a QR code
  String qrData = "https://flutter.dev"; 
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Generate QR Code")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // The actual QR Code widget
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
              gapless: false,
            ),
            const SizedBox(height: 40),
            // Input field for the user to type text
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter text or URL",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrData = _controller.text; // Update the QR code!
                });
              },
              child: const Text("Generate New QR"),
            ),
          ],
        ),
      ),
    );
  }
}