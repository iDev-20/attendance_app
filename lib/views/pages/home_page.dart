// ignore_for_file: avoid_print

import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/views/pages/profile/profile_page.dart';
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
                        "What's up Jermaine!",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Time to do what you do best',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [],
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
