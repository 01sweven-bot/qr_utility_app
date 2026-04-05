import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool isScanCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: MobileScanner(
        onDetect: (capture) {
          // 1. Check if the "Gate" is open
          if (!isScanCompleted) {
            final List<Barcode> barcodes = capture.barcodes;
            
            if (barcodes.isNotEmpty) {
              // 2. IMMEDIATELY close the gate
              setState(() {
                isScanCompleted = true;
              });

              final String code = barcodes.first.rawValue ?? "No data found";

              // 3. Show the popup
              showDialog(
                context: context,
                barrierDismissible: false, // User must click "Close"
                builder: (context) => AlertDialog(
                  title: const Text("Scan Result"),
                  content: Text(code),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close popup
                        // 4. Reset the gate when they are ready to scan again
                        setState(() {
                          isScanCompleted = false;
                        });
                      },
                      child: const Text('Close'),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}