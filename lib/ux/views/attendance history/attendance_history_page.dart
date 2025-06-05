import 'package:attendance_app/ux/shared/models/ui_models.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:attendance_app/ux/views/home/components/course_card.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  final List<String> periods = [
    AppStrings.today,
    AppStrings.today,
    AppStrings.pastWeek,
  ];

  final List<List<Course>> courseHistory = [
    [
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.present,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.late,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.absent,
        showStatus: true,
      ),
    ],
    [
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.absent,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.absent,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.present,
        showStatus: true,
      ),
    ],
    [
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.late,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.late,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.present,
        showStatus: true,
      ),
      Course(
        courseCode: 'CS101',
        courseTitle: 'Introduction to Computer Science',
        status: AppStrings.absent,
        showStatus: true,
      ),
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      hideAppBar: true,
      headerTitle: AppStrings.attendanceHistory,
      headerSubtitle: AppStrings.viewYourAttendanceHistory,
      hasRefreshIndicator: true,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: periods.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              period(period: periods[index]),
              ...courseHistory[index]
                  .map((course) => CourseCard(course: course))
                  .toList(),
            ],
          );
        },
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
