import 'package:attendance_app/ux/navigation/navigation.dart';
import 'package:attendance_app/ux/shared/components/back_and_next_button_row.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppConfirmationBottomSheet extends StatelessWidget {
  const AppConfirmationBottomSheet(
      {super.key,
      required this.text,
      this.secondButtonText,
      this.secondButtonColor});

  final String text;
  final String? secondButtonText;
  final Color? secondButtonColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Icon(Icons.info, color: AppColors.defaultColor, size: 30),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                text,
                style: const TextStyle(height: 1.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BackAndNextButtonRow(
          onTapNextButton: () {
            Navigation.back(
              context: context,
              result: true,
            );
          },
          firstText: 'Cancel',
          secondText: secondButtonText ?? 'Yes',
          buttonColor: secondButtonColor,
        ),
      ],
    );
  }
}
