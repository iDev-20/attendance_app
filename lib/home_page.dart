import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/qr_code_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Figtree',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('Your Schedule'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Attendance Log',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Figtree',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const QrCodePage()));
              },
              child: const Text('Gnerate new code'),
            ),
          ),
        ],
      ),
    );
  }
}
