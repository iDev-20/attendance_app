import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

bool isSchoolEmail(String email) {
  if (email.contains('@ait.edu.gh')) {
    return true;
  } else {
    return false;
  }
}

void showAlert(
    {required BuildContext context,
    required String title,
    required String desc,
    String? buttonText}) {
  Alert(
    context: context,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
        },
        width: 200,
        color: Colors.blueGrey.shade900,
        child: Text(
          buttonText ?? 'Try again',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ],
  ).show();
}
