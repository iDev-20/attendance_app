import 'dart:io';

import 'package:attendance_app/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:attendance_app/components/date_time_extensions.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) async {
        result = scanData;
        print(result?.code);
        controller.stopCamera();
        if (result?.code == DateTime.now().fullFriendlyDate()) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => LoginPage()));
          print(DateTime.now());
        }
        // customNavigation(
        //   context,
        //   ScanResult(
        //     code: result!.code,
        //   ),
        // );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  bool flash = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  overlayColor: const Color.fromRGBO(71, 37, 37, 0.6),
                  borderColor: Colors.white,
                  borderWidth: 10,
                  borderRadius: 2,
                  cutOutSize: 300),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 85,
                  padding: const EdgeInsets.all(5),
                  child: const Row(children: [
                    Text(
                      'Exit',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.close_sharp,
                      size: 27,
                      color: Colors.white,
                    )
                  ]),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                width: 140,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.5),
                    color: Colors.white),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            controller!.flipCamera();
                          },
                          child: const Icon(
                            Icons.flip_camera_android,
                            size: 27,
                            color: Colors.black,
                          )),
                      Container(
                        width: 1,
                        color: const Color.fromRGBO(102, 102, 102, 1),
                      ),
                      InkWell(
                          onTap: () async {
                            await controller!.toggleFlash();
                            setState(() {
                              flash = !flash;
                            });
                          },
                          child: Icon(
                            flash ? Icons.flash_off : Icons.flash_on,
                            size: 27,
                            color: Colors.black,
                          )),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
