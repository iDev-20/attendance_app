import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_page.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/views/pages/attendance%20history/components/course_attendance_card.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      headerTitle: AppStrings.attendanceHistory,
      headerSubtitle: AppStrings.viewYourAttendanceHistory,
      hasRefreshIndicator: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          period(period: AppStrings.today),
          const CourseAttendanceCard(status: AppStrings.present),
          const CourseAttendanceCard(status: AppStrings.late),
          const CourseAttendanceCard(status: AppStrings.absent),
          period(period: AppStrings.today),
          const CourseAttendanceCard(status: AppStrings.absent),
          const CourseAttendanceCard(status: AppStrings.absent),
          const CourseAttendanceCard(status: AppStrings.present),
          period(period: AppStrings.pastWeek),
          const CourseAttendanceCard(status: AppStrings.late),
          const CourseAttendanceCard(status: AppStrings.late),
          const CourseAttendanceCard(status: AppStrings.present),
          const CourseAttendanceCard(status: AppStrings.absent),
        ],
      ),
    );
  }

  Widget period({required String period}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        period,
        style: const TextStyle(
          color: AppColors.defaultColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
