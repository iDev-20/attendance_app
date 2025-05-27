import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:attendance_app/resources/app_colors.dart';

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
    style: AlertStyle(
      alertBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      isCloseButton: false,
      overlayColor: Colors.black.withOpacity(0.5),
      titleStyle: const TextStyle(
          color: AppColors.defaultColor,
          fontSize: 18,
          fontWeight: FontWeight.w700),
      descStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      alertPadding: const EdgeInsets.all(65),
    ),
    context: context,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
        },
        // width: 200,
        color: Colors.blueGrey.shade900,
        radius: BorderRadius.circular(20),
        child: Text(
          buttonText ?? 'Try again',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ],
  ).show();
}
