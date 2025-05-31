import 'package:attendance_app/ux/shared/models/ui_models.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:flutter/material.dart';

// class FullCourseListPage extends StatefulWidget {
//   final List<CourseInfo> courses;

//   const FullCourseListPage({super.key, required this.courses});

//   @override
//   State<FullCourseListPage> createState() => _FullCourseListPageState();
// }

// class _FullCourseListPageState extends State<FullCourseListPage> {
//   int? expandedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return AppPageScaffold(
//       hideAppBar: false,
//       title: 'All Courses',
//       body: ListView.builder(
//         itemCount: widget.courses.length,
//         itemBuilder: (context, index) {
//           final course = widget.courses[index];
//           final isExpanded = expandedIndex == index;

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 visualDensity: VisualDensity.compact,
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                 dense: true,
//                 title: Text(
//                   course.courseCode,
//                   style: const TextStyle(
//                     color: AppColors.defaultColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 // subtitle: Text(
//                 //   '${course.creditHours} Credit Hours',
//                 //   style: const TextStyle(color: Colors.grey),
//                 // ),
//                 trailing: Icon(
//                   isExpanded ? Icons.expand_less : Icons.expand_more,
//                   color: isExpanded
//                       ? AppColors.defaultColor
//                       : AppColors.defaultColor,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     expandedIndex = isExpanded ? null : index;
//                   });
//                 },
//               ),
//               if (isExpanded)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Column(
//                         children: [
//                           Text('CS101 - Intro to CS'),
//                           Text('Seaview Weekend'),
//                         ],
//                       ),
//                       Text('${course.creditHours} Credit Hours'),
//                     ],
//                   ),
//                 ),
//               const Divider(height: 1),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

class FullCourseListPage extends StatefulWidget {
  final List<CourseInfo> courses;

  const FullCourseListPage({super.key, required this.courses});

  @override
  State<FullCourseListPage> createState() => _FullCourseListPageState();
}

class _FullCourseListPageState extends State<FullCourseListPage> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      hideAppBar: false,
      title: 'All Courses',
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemCount: widget.courses.length,
        itemBuilder: (context, index) {
          final course = widget.courses[index];
          // final isExpanded = expandedIndex == index;

          return ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            title: Text(
              course.courseCode,
              style: const TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Course Title',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        'Introduction to Computer Science',
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Stream',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text('Seaview Weekend'),
                      const SizedBox(height: 8),
                      const Text(
                        'Credit Hours',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text('${course.creditHours} Credit Hours'),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
