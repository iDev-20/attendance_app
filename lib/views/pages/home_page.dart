// ignore_for_file: avoid_print

import 'package:attendance_app/resources/app_buttons.dart';
import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/views/pages/scan_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        // print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Spacer(),
              PrimaryButton(
                backgroundColor: Colors.blueGrey.shade900,
                onTap: () {
                  Navigation.navigateToScreen(
                      context: context, screen: const ScanPage());
                },
                child: const Text('Scan QR code'),
              ),
              const Spacer(),
              //For testing
              // ElevatedButton(
              //   onPressed: (){
              //     _auth.signOut();
              //     SharedPreferences.getInstance().then((prefs) {
              //       prefs.setBool('isLoggedIn', false);
              //     });
              //     Navigation.navigateToScreenAndClearAllPrevious(
              //       context: context,
              //       screen: const SignUpPage()
              //     );
              //   },
              //   child: const Text('Logout'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
