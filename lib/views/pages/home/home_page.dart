// ignore_for_file: avoid_print

import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_buttons.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_page.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/utils/greeting_utils.dart';
import 'package:attendance_app/views/pages/course_details_page.dart';
import 'package:attendance_app/views/pages/home/components/course_card.dart';
import 'package:attendance_app/views/pages/home/components/dashboard_metric_grid_view.dart';
import 'package:attendance_app/views/pages/scan_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        // print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      headerTitle: getGreetingTitle('Jermaine'),
      headerSubtitle: getGreetingSubtitle(),
      showInformationBanner: true,
      hasRefreshIndicator: true,
      body: ListView(
        // padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          upcomingClass(),
          headerWidget(
            period: AppStrings.semesterCourses,
            hasAction: true,
            onTap: () {},
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DashboardMetricGridView(
              children: [
                singleCourse(
                    title: 'MATH201',
                    creditHours: '3',
                    color: AppColors.boxColor1),
                singleCourse(
                    title: 'CS203',
                    creditHours: '2',
                    color: AppColors.boxColor2),
                singleCourse(
                    title: 'CS205',
                    creditHours: '3',
                    color: AppColors.boxColor3),
                singleCourse(
                    title: 'CE201/CE202',
                    creditHours: '3',
                    color: AppColors.boxColor4),
                singleCourse(
                    title: 'CE203/CE204',
                    creditHours: '3',
                    color: AppColors.boxColor5),
                singleCourse(
                    title: 'ENG233',
                    creditHours: '3',
                    color: AppColors.boxColor6),
                singleCourse(
                    title: 'FRN101',
                    creditHours: '3',
                    color: AppColors.boxColor3),
                singleCourse(
                    title: 'ENG207',
                    creditHours: '1',
                    color: AppColors.boxColor1),
              ],
            ),
          ),
          const SizedBox(height: 16),
          headerWidget(period: AppStrings.todaysClasses, hasAction: false),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
        ],
      ),
    );
  }

  Widget upcomingClass() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.defaultColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.upcoming,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'CS104 - Data Structures and Algorithms',
                style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  '8:00AM - 9:30AM',
                  style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                onTap: () {
                  Navigation.navigateToScreen(
                      context: context, screen: const ScanPage());
                },
                backgroundColor: AppColors.defaultColor,
                foregroundColor: AppColors.white,
                child: const Text(AppStrings.markAttendance),
              )
            ],
          )),
    );
  }

  Widget headerWidget(
      {required String period, required bool hasAction, VoidCallback? onTap}) {
    return AppMaterial(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              period,
              style: const TextStyle(
                color: AppColors.defaultColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (hasAction == true)
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryTeal,
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //   color: AppColors.primaryTeal,
                  // ),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppColors.defaultColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget singleCourse(
      {required String creditHours,
      required String title,
      required Color color}) {
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
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              creditHours,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              title,
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

//For testing
// ElevatedButton(
//   onPressed: (){
//     _auth.signOut();
//     SharedPreferences.getInstance().then((prefs) {
//       prefs.setBool('isLoggedIn', false);
//     });
//     Navigation.navigateToScreenAndClearAllPrevious(
//       context: context,
//       screen: const SignUpPage()
//     );
//   },
//   child: const Text('Logout'),
// ),
