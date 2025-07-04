import 'package:attendance_app/ux/shared/components/app_material.dart';
import 'package:attendance_app/ux/shared/components/back_and_next_button_row.dart';
import 'package:attendance_app/ux/shared/models/ui_models.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:flutter/material.dart';

class ConfirmCoursesPage extends StatefulWidget {
  const ConfirmCoursesPage({super.key});

  @override
  State<ConfirmCoursesPage> createState() => _ConfirmCoursesPageState();
}

class _ConfirmCoursesPageState extends State<ConfirmCoursesPage> {
  List<SemesterCourse> courses = [
    SemesterCourse(
        courseCode: 'CS306', courseTitle: 'Computer Architecture Lab'),
    SemesterCourse(courseCode: 'CS311', courseTitle: 'Datebase system 1'),
    SemesterCourse(
        courseCode: 'CE301/CE302',
        courseTitle: 'Electronic Device & Circuits Electronics Lab'),
    SemesterCourse(
        courseCode: 'CE303', courseTitle: 'Embedded Microprocessor Systems'),
    SemesterCourse(
        courseCode: 'EEE303', courseTitle: 'Communication Systems 1'),
    SemesterCourse(courseCode: 'CE304', courseTitle: 'Systems and Signals'),
    SemesterCourse(
        courseCode: 'CS208',
        courseTitle: 'Data Communications & Computer Networks 1'),
    SemesterCourse(
        courseCode: 'ENG307',
        courseTitle: 'Eng Lab 4 - Microcomputer Tech Lab'),
    SemesterCourse(courseCode: 'ENG306', courseTitle: 'Research Methodology'),
    SemesterCourse(
        courseCode: 'FAB301',
        courseTitle: 'Digital Fabrication for Product Development'),
  ];

  SemesterCourse? selectedCourses;

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      hideAppBar: false,
      showBackButton: false,
      title: AppStrings.confirmSemeterCourses,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: courses
                  .map(
                    (semesterCourses) => courseCard(
                      semesterCourse: semesterCourses,
                      selected: true,
                      onTap: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Total credit hours: ',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontFamily: 'Nunito'),
                        children: <TextSpan>[
                          TextSpan(
                            text: '18',
                            style: TextStyle(
                                color: AppColors.defaultColor,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackAndNextButtonRow(
                  enableBackButton: false,
                  // enableNextButton: false,
                  firstText: 'Add Course',
                  secondText: 'Confirm',
                  onTapFirstButton: () {},
                  onTapNextButton: () {},
                ),
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.defaultColor,
      //   foregroundColor: AppColors.white,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget courseCard(
      {required SemesterCourse semesterCourse,
      required bool selected,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppMaterial(
        color: selected ? AppColors.primaryTeal : AppColors.white,
        inkwellBorderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? AppColors.defaultColor : AppColors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    semesterCourse.courseCode,
                    style: const TextStyle(
                        color: AppColors.defaultColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    semesterCourse.courseTitle,
                    style: const TextStyle(
                        color: AppColors.defaultColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Icon(
                selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                color: selected ? AppColors.defaultColor : AppColors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
