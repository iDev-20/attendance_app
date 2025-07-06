import 'package:attendance_app/ux/navigation/navigation.dart';
import 'package:attendance_app/ux/shared/components/app_material.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:attendance_app/ux/views/attendance/online_attendance_code_entry_page.dart';
import 'package:attendance_app/ux/views/attendance/scan_page.dart';
import 'package:flutter/material.dart';

class SelectAttendanceModePage extends StatelessWidget {
  const SelectAttendanceModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      hideAppBar: true,
      headerTitle: AppStrings.selectAttendanceType,
      headerSubtitle: AppStrings.areYouAttendingInPersonOrOnline,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            attendanceMode(
              mode: 'In-person',
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const ScanPage());
              },
            ),
            const SizedBox(height: 20),
            attendanceMode(
              mode: 'Online',
              onTap: () {
                Navigation.navigateToScreen(
                    context: context,
                    screen: const OnlineAttendanceCodeEntryPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget attendanceMode({required String mode, required VoidCallback onTap}) {
    return Expanded(
      child: AppMaterial(
        color: AppColors.primaryTeal,
        borderRadius: BorderRadius.circular(30),
        inkwellBorderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.defaultColor)),
          child: Text(
            mode,
            style: const TextStyle(
                color: AppColors.defaultColor,
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
