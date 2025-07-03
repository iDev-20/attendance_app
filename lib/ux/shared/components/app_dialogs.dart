import 'package:attendance_app/ux/shared/resources/app_buttons.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String desc;
  final String? subDesc;
  final String firstOption;
  final String secondOption;
  final Function() onFirstOptionTap;
  final Function() onSecondOptionTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const AppAlertDialog(
      {super.key,
      required this.title,
      required this.desc,
      this.subDesc,
      required this.firstOption,
      required this.secondOption,
      required this.onFirstOptionTap,
      required this.onSecondOptionTap,
      this.backgroundColor,
      this.borderColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Material(
        elevation: 0,
        color: AppColors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.defaultColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Visibility(
              visible: subDesc?.isNotEmpty ?? false,
              child: Text(
                subDesc ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: PrimaryOutlinedButton(
                    borderColor: borderColor ?? AppColors.defaultColor,
                    onTap: onFirstOptionTap,
                    child: Text(
                      firstOption,
                      style: TextStyle(
                        color: textColor ?? AppColors.defaultColor,
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PrimaryButton(
                    backgroundColor: backgroundColor ?? AppColors.defaultColor,
                    onTap: onSecondOptionTap,
                    child: Text(secondOption),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
