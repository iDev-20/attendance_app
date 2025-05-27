import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_page.dart';
import 'package:attendance_app/views/pages/attendance%20history/components/attendance_card.dart';
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
      headerTitle: 'Attendance History',
      headerSubtitle: 'View your attendance history',
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          period(period: 'Today'),
          const CourseAttendanceCard(status: 'Present'),
          const CourseAttendanceCard(status: 'Late'),
          const CourseAttendanceCard(status: 'Absent'),
          period(period: 'Yesterday'),
          const CourseAttendanceCard(status: 'Absent'),
          const CourseAttendanceCard(status: 'Absent'),
          const CourseAttendanceCard(status: 'Present'),
          period(period: 'Past Week'),
          const CourseAttendanceCard(status: 'Late'),
          const CourseAttendanceCard(status: 'Late'),
          const CourseAttendanceCard(status: 'Present'),
          const CourseAttendanceCard(status: 'Absent'),
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
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
