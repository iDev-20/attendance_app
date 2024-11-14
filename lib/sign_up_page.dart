// ignore_for_file: unused_field, use_build_context_synchronously, avoid_print

import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/form_fields.dart';
import 'package:attendance_app/global_functions.dart';
import 'package:attendance_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool showSpinner = false;

  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AbsorbPointer(
        absorbing: false, //this hides the keyboard anytime the screen is tapped
        child: Scaffold(
          resizeToAvoidBottomInset:
              false, //this stops the background image from moving anytime the keyboard is initiated
          body: ModalProgressHUD(
            //this shows the loader
            inAsyncCall: showSpinner,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/background_image.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.darken),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 50),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Attendify',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Merriweather',
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(85))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, top: 40.0, right: 40.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey.shade900),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPrimaryTextFormField(
                                    labelText: 'Student Email',
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'idnumber@ait.edu.gh',
                                  ),
                                  CustomPrimaryTextFormField(
                                    labelText: 'Password',
                                    obscureText: !isPasswordVisible,
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    suffixWidget: IconButton(
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey.shade700,
                                      ),
                                      onPressed: togglePasswordVisibility,
                                    ),
                                    hintText: 'Enter your Password',
                                  ),
                                  CustomPrimaryTextFormField(
                                    labelText: 'Confirm password',
                                    obscureText: !isConfirmPasswordVisible,
                                    controller: confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    suffixWidget: IconButton(
                                      icon: Icon(
                                        isConfirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey.shade700,
                                      ),
                                      onPressed:
                                          toggleConfirmPasswordVisibility,
                                    ),
                                    hintText: 'Re-enter your Password',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PrimaryButton(
                                    backgroundColor: Colors.blueGrey.shade900,
                                    onTap: () async {
                                      //check if email entered is a school email
                                      if (isSchoolEmail(emailController.text) ==
                                          false) {
                                        setState(() {
                                          showSpinner = false;
                                        });
                                        showAlert(context, 'Invalid Email',
                                            'Please enter a valid AIT email address');
                                        return;
                                      }

                                      if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        showAlert(
                                          context,
                                          'Sign up failed',
                                          'Passwords do not match',
                                        );
                                        return;
                                      }
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      try {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        //saves data on device and making the sign up page not to show once
                                        //a user has signed up already(keeping the user signed in)
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString(
                                            'email', emailController.text);
                                        prefs.setBool('isLoggedIn', true);

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const HomePage(),
                                                ),
                                                (route) => false);
                                        setState(() {
                                          showSpinner = false;
                                        });
                                      } catch (e) {
                                        setState(() {
                                          showSpinner = false;
                                        });
                                        showAlert(
                                          context,
                                          'Sign up failed',
                                          e.toString(),
                                        );
                                        print(e);
                                      }
                                    },
                                    child: const Text('Sign Up'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
