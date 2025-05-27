// ignore_for_file: avoid_print

import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_buttons.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_page.dart';
import 'package:attendance_app/views/pages/home/components/course_card.dart';
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
      headerTitle: "What's up Jermaine!",
      headerSubtitle: 'Time to do what you do best',
      showInformationBanner: true,
      body: ListView(
        // padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          upcomingClass(),
          headerWidget(period: "Today's Classes"),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
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
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryTeal.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upcoming',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'CS104 - Data Structures and Algorithms',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  '8:00AM - 9:30AM',
                  style: TextStyle(
                    color: AppColors.white,
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
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.defaultColor,
                child: const Text('Mark attendance'),
              )
            ],
          )),
    );
  }

  Widget headerWidget({required String period}) {
    return AppMaterial(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              period,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryTeal.withOpacity(0.2),
                  )),
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: AppColors.primaryTeal,
              ),
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
