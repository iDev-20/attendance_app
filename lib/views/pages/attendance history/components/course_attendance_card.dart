import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/extensions/date_time_extensions.dart';
import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/views/pages/course_details_page.dart';
import 'package:flutter/material.dart';

class CourseAttendanceCard extends StatelessWidget {
  const CourseAttendanceCard({super.key, required this.status});

  final String status;

  Color getStatusColor(String status) {
    switch (status) {
      case AppStrings.present:
        return Colors.green.shade500;
      case AppStrings.absent:
        return Colors.red.shade500;
      case AppStrings.late:
        return Colors.orange.shade500;
      default:
        return Colors.grey.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: AppMaterial(
        onTap: () {
          Navigation.navigateToScreen(
              context: context, screen: const CourseDetailsPage());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.primaryTeal,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      DateTime.now().friendlyMonthShort().toUpperCase(),
                      style: const TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateTime.now().day.toString(),
                      style: const TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CS101',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.defaultColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Introduction to Computer Science',
                            style: TextStyle(
                              color: AppColors.defaultColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    DateTime.now().friendlyTime(),
                    style: const TextStyle(
                        color: AppColors.defaultColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.primaryTeal,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      status,
                      style: TextStyle(
                          color: getStatusColor(status),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
