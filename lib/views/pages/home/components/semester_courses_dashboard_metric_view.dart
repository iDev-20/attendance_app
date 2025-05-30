import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/components/dashboard_metric_grid_view.dart';
import 'package:attendance_app/models/ui_models.dart';
import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/views/pages/course_details_page.dart';
import 'package:attendance_app/views/pages/home/components/section_header.dart';
import 'package:attendance_app/views/pages/home/full_course_list_page.dart';
import 'package:flutter/material.dart';

class SemesterCoursesDashboardMetricView extends StatelessWidget {
  SemesterCoursesDashboardMetricView({super.key});

  // final List<CourseInfo> courses = [
  //   CourseInfo(
  //       courseCode: 'MATH201', creditHours: '3'),
  //   CourseInfo(
  //       courseCode: 'CS203', creditHours: '2'),
  //   CourseInfo(
  //       courseCode: 'CS205', creditHours: '3'),
  //   CourseInfo(
  //       courseCode: 'CE201/CE202',
  //       creditHours: '3'),
  //   CourseInfo(
  //       courseCode: 'CE203/CE204',
  //       creditHours: '3'),
  //   CourseInfo(
  //       courseCode: 'ENG233', creditHours: '3'),
  //   CourseInfo(
  //       courseCode: 'FRN101', creditHours: '3'),
  //   CourseInfo(
  //       courseCode: 'ENG207', creditHours: '1'),
  // ];

  final List<CourseInfo> courses = [
    'MATH201|3',
    'CS203|2',
    'CS205|3',
    'CE201/CE202|3',
    'CE203/CE204|3',
    'ENG233|3',
    'FRN101|3',
    'ENG207|1',
    // 'CS313|3',
    // 'CS450|2',
  ].asMap().entries.map((entry) {
    int index = entry.key;
    var split = entry.value.split('|');
    return CourseInfo(
      courseCode: split[0],
      creditHours: split[1],
      index: index,
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          period: AppStrings.semesterCourses,
          hasAction: courses.length > 9,
          onTap: () {
            if (courses.length > 9) {
              Navigation.navigateToScreen(
                  context: context, screen: FullCourseListPage(courses: courses,));
            }
          },
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
          child: DashboardMetricGridView(
            children: [
              ...courses
                  .map((course) =>
                      singleCourse(context: context, course: course))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget singleCourse(
      {required BuildContext context, required CourseInfo course}) {
    return AppMaterial(
      borderRadius: BorderRadius.circular(15),
      inkwellBorderRadius: BorderRadius.circular(15),
      elevation: 1,
      onTap: () {
        Navigation.navigateToScreen(
            context: context, screen: const CourseDetailsPage());
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 12, top: 10, right: 12, bottom: 12),
        decoration: BoxDecoration(
          color: course.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              course.creditHours,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              course.courseCode,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
