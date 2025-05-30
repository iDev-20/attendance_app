import 'package:attendance_app/extensions/date_time_extensions.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_page.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:flutter/material.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  final String status = '';

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
    return AppPageScaffold(
      hideAppBar: false,
      hasRefreshIndicator: true,
      title: AppStrings.courseDetails,
      // showDivider: true,
      showInformationBanner: true,
      informationBannerText: AppStrings.sampleEligibilityText,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CS101 - Introduction to Computer Science',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'FRANCIS AVEVOR',
                        style: TextStyle(
                            color: Colors.grey,
                            // fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 16, top: 12, right: 16),
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.defaultColor),
                        ),
                        child: Column(
                          children: [
                            courseDetailItem(
                                title: AppStrings.attendanceThreshold,
                                value: '18/20'),
                            courseDetailItem(
                                title: AppStrings.midSemester, value: '6/10'),
                            courseDetailItem(
                                title: AppStrings.endOfSemester, value: '6/20'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        AppStrings.history,
                        style: TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sessionHistory(
                          title: 'Session 1', status: AppStrings.absent),
                      sessionHistory(
                          title: 'Session 2', status: AppStrings.present),
                      sessionHistory(
                          title: 'Session 3', status: AppStrings.present),
                      sessionHistory(
                          title: 'Session 4', status: AppStrings.late),
                      sessionHistory(
                          title: 'Session 5', status: AppStrings.present),
                      sessionHistory(
                          title: 'Session 6', status: AppStrings.present),
                      sessionHistory(
                          title: 'Session 7', status: AppStrings.present),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget courseDetailItem({
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        color: AppColors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey.shade600, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(
                color: AppColors.defaultColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget sessionHistory({required String title, required String status}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: AppColors.defaultColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                DateTime.now().friendlySlashDate(),
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.primaryTeal,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              status,
              style: TextStyle(
                  color: getStatusColor(status), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
