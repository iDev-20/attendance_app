import 'dart:io';

import 'package:attendance_app/resources/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationSuccessPage extends StatefulWidget {
  const VerificationSuccessPage({super.key});

  @override
  State<VerificationSuccessPage> createState() =>
      _VerificationSuccessPageState();
}

class _VerificationSuccessPageState extends State<VerificationSuccessPage> {
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
        title: const Text('Verification Success'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Congrats! 🎉 Your attendance has been successfully recorded. '
                'Thanks for being here today – keep up the great work!',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                backgroundColor: Colors.blueGrey.shade900,
                onTap: () {
                  //this exits the app in andriod
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  }
                  //this exits the app in ios
                  else {
                    exit(0);
                  }
                },
                child: const Text('Exit app'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
