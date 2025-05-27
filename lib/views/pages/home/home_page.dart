// ignore_for_file: avoid_print

import 'package:attendance_app/resources/app_page.dart';
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [],
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
