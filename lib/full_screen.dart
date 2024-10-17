import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FullScreenQRCode extends StatelessWidget {
  final String qrData;

  const FullScreenQRCode({Key? key, required this.qrData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
