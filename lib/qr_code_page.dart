import 'package:attendance_app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Figtree',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('QR Code'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImageView(
                    data: 'This QR code has an embedded image as well',
                    version: QrVersions.auto,
                    size: 250,
                    gapless: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  const Expanded(child: PrimaryButton(child: Text('Refresh'))),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: PrimaryButton(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black,
                        child: const Text('Download')),
                  ),
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(16),
              //       border: Border.all(color: Colors.black)),
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       shareRow(
              //           icon: Icon(Icons.copy, color: Colors.grey.shade600),
              //           text: 'Copy link'),
              //       shareRow(
              //           icon: Icon(Icons.refresh, color: Colors.grey.shade600),
              //           text: 'Refresh'),
              //       shareRow(
              //           icon: Icon(Icons.download, color: Colors.grey.shade600),
              //           text: 'Download')
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shareRow({required Icon icon, required String text}) {
    return Column(
      children: [
        Container(
          height: 37,
          width: 37,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: Colors.white),
          child: icon,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
