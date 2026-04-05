import 'package:flutter/material.dart';
import 'scanner_screen.dart';
import 'generator_screen.dart';

void main() {
  runApp(const QRApp());
}

class QRApp extends StatelessWidget {
  const QRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Utility App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Utility"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Button 1: Scan QR Code
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ScannerScreen()),
);
                // We will add the Camera Scanner logic here next
              },
              icon: const Icon(Icons.qr_code_scanner, size: 30),
              label: const Text("Scan QR Code", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            
            // Button 2: Generate QR Code
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GeneratorScreen()),
                );
              },
              icon: const Icon(Icons.add_box, size: 30),
              label: const Text("Generate QR Code", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            const Divider(height: 60),
            const Text(
              "Recent Scans",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            // This area will show the history list later
            const Expanded(
              child: Center(
                child: Text("No history available yet.", style: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}