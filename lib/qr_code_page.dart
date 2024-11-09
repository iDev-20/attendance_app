import 'package:attendance_app/attendance_log.dart';
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/full_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  String qrData = 'Generate your lecture QR code';
  List<Map<String, String>> attendanceData1 = [
    {'studentName': 'John Doe', 'timestamp': DateTime.now().toString()},
    {'studentName': 'Jane Smith', 'timestamp': DateTime.now().toString()},
  ];

  // bool isVisible = false;

  void generateQRCode() {
    setState(() {
      qrData = DateTime.now().toString();

      // attendanceData1 = [
      //   {'studentName': 'John Doe', 'timestamp': DateTime.now().toString()},
      //   {'studentName': 'Jane Smith', 'timestamp': DateTime.now().toString()},
      // ];
    });
  }

  void openFullScreenQRCode(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenQRCode(qrData: qrData),
      ),
    );
  }

  void viewAttendanceLog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AttendanceLogScreen(attendanceData: attendanceData1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          fontFamily: 'Lato',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('QR Code'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          // visible: isVisible,
                          replacement: const Text(
                            'Your QR code will show here!',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  openFullScreenQRCode(context);
                                },
                                child: QrImageView(
                                  data: qrData,
                                  version: QrVersions.auto,
                                  size: 150,
                                  // gapless: false,
                                ),
                              ),
                              const Text(
                                'Tap the QR code to display fullscreen',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
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
                        Expanded(
                          child: PrimaryButton(
                            backgroundColor: Colors.blueGrey.shade900,
                            onTap: () {
                              generateQRCode();
                            },
                            child: const Text('Generate QR Code'),
                          ),
                        ),
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
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'QR Code Data: $qrData',
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SecondaryButton(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      onTap: () => viewAttendanceLog(context),
                      child: const Text('View Attendance Log'),
                    ),
                  ),
                ],
              ),
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
