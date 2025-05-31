// ignore_for_file: unused_field, use_build_context_synchronously, avoid_print

import 'package:attendance_app/ux/shared/resources/app_buttons.dart';
import 'package:attendance_app/ux/shared/resources/app_form_fields.dart';
import 'package:attendance_app/ux/shared/components/global_functions.dart';
import 'package:attendance_app/ux/navigation/navigation.dart';
import 'package:attendance_app/ux/views/verification_success_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<VerificationPage> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool showSpinner = false;

  late String password;
  late String email;

  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
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
            inAsyncCall: showSpinner,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/background_image.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 120, bottom: 100),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'You came to class huh?',
                          style: TextStyle(
                            color: Colors.white,
                            // fontFamily: 'Merriweather',
                            fontSize: 35,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 55.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Let\'s verify that',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey.shade900),
                              ),
                            ),
                            const SizedBox(height: 55),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPrimaryTextFormField(
                                    labelText: 'School Email',
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'idnumber@ait.edu.gh',
                                  ),
                                  CustomPrimaryTextFormField(
                                    labelText: 'Pasword',
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
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PrimaryButton(
                              backgroundColor: Colors.blueGrey.shade900,
                              onTap: () async {
                                setState(() {
                                  showSpinner = true;
                                });

                                //check if email entered is a school email
                                if (isSchoolEmail(emailController.text) ==
                                    false) {
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  showAlert(
                                      context: context,
                                      title: 'Invalid Email',
                                      desc:
                                          'Please enter a valid AIT email address');
                                  return;
                                }

                                //confirm email entered is the same as the email used to sign up
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                var email = prefs.getString('email');
                                if (email != emailController.text) {
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  showAlert(
                                      context: context,
                                      title: 'Email mismatch',
                                      desc:
                                          'The email you entered does not match the email you signed up with');
                                  return;
                                }

                                try {
                                  await _auth.signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Navigation.navigateToScreen(
                                      context: context,
                                      screen: const VerificationSuccessPage());
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  showAlert(
                                    context: context,
                                    title: 'Verification failed',
                                    desc: 'Incorrect password',
                                  );
                                  print(e);
                                }
                              },
                              child: const Text('Verify'),
                            ),
                            const SizedBox(
                              height: 16,
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
