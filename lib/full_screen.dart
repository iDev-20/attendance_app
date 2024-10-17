import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FullScreenQRCode extends StatelessWidget {
  final String qrData;

  const FullScreenQRCode({Key? key, required this.qrData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for better contrast
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: MediaQuery.of(context).size.width * 0.8, // Large size for projection
          backgroundColor: Colors.white, // Ensures QR code visibility
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pop(context); // Close full-screen mode
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
