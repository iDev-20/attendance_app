import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorPage extends StatefulWidget {
  @override
  _QRCodeGeneratorPageState createState() => _QRCodeGeneratorPageState();
}

class _QRCodeGeneratorPageState extends State<QRCodeGeneratorPage> {
  String _qrData = 'Generate your lecture QR code';

  void _generateQRCode() {
    setState(() {
      // Generate a unique code (e.g., a timestamp or UUID) for the lecture
      _qrData = DateTime.now().toIso8601String(); // Unique QR data for each lecture
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Generate QR Code for Attendance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            QrImageView(
              data: _qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQRCode,
              child: const Text('Generate QR Code'),
            ),
            const SizedBox(height: 20),
            Text(
              'QR Code Data: $_qrData',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
