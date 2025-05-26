import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/views/pages/attendance_card.dart';
import 'package:attendance_app/views/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.defaultColor,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attendance History',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View your attendance details',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      appBarAction(icon: Icons.notifications, onTap: () {}),
                      const SizedBox(width: 16),
                      appBarAction(
                        icon: Icons.person_rounded,
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context, screen: const ProfilePage());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
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
            )
          ],
        ),
      ),
    );
  }

  Widget appBarAction({required IconData icon, required VoidCallback onTap}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.defaultColor,
          ),
        ),
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
