// ignore_for_file: avoid_print

import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:attendance_app/platform/utils/greeting_utils.dart';
import 'package:attendance_app/ux/views/home/components/semester_courses_dashboard_metric_view.dart';
import 'package:attendance_app/ux/views/home/components/todays_classes.dart';
import 'package:attendance_app/ux/views/home/components/upcoming_class.dart';
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
      hideAppBar: true,
      headerTitle: getGreetingTitle(AppStrings.sampleAppUser),
      headerSubtitle: getGreetingSubtitle(),
      showInformationBanner: true,
      informationBannerText: AppStrings.sampleAttendanceThresholdMessage,
      hasRefreshIndicator: true,
      body: ListView(
        children: [
          const UpcomingClass(),
          SemesterCoursesDashboardMetricView(),
          TodaysClasses(),
        ],
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
