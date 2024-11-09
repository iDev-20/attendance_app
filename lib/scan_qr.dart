// import 'package:attendance_app/scan_page.dart';
// import 'package:flutter/material.dart';

// class ScanQr extends StatefulWidget {
//   const ScanQr({super.key});

//   @override
//   State<ScanQr> createState() => _ScanQrState();
// }

// class _ScanQrState extends State<ScanQr> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: myAppBar('Scan QR Code', context),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40.0),
//         child: Column(
//           children: [
//             SizedBox(height: 50),
//             Text(
//               'Press the Scan QR Code button to scan your designated QR Code at your assigned post',
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.green),
//               textAlign: TextAlign.center,
//             ),
//             Flexible(child: SizedBox(height: 79)),
//             Image.asset(
//               'assets/images/qr_code.png',
//               height: MediaQuery.of(context).size.height * 0.3,
//             ),
//             Flexible(child: SizedBox(height: 79)),
//             InkWell(
//               onTap: () {
//                 Get.to(const ScanPage());
//               },
//               child: longButton('Scan QR Code'),
//             ),
//             SizedBox(height: 90),
//           ],
//         ),
//       ),
//     );
//   }
// }
