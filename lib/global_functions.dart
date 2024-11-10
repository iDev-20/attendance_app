
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

bool isSchoolEmail(String email) {
  if (email.contains('@ait.edu.gh')) {
    return true;
  } else {
    return false;
  }
}


void showAlert(BuildContext context, String title, String desc) {
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
          child: const Text(
            'Try again',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),
        ),
      ],
    ).show();
  }