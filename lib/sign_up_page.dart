// ignore_for_file: unused_field, use_build_context_synchronously, avoid_print

import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/form_fields.dart';
import 'package:attendance_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool showSpinner = false;

  late String email;
  late String password;

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
                          'Class Control',
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
                                  const CustomPrimaryTextFormField(
                                    labelText: 'First name',
                                    hintText: 'John',
                                  ),
                                  const CustomPrimaryTextFormField(
                                    labelText: 'Last name',
                                    hintText: 'Doe',
                                  ),
                                  CustomPrimaryTextFormField(
                                    labelText: 'Email',
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'example@gmail.com',
                                    onChanged: (value) {
                                      email = value;
                                    },
                                  ),
                                  CustomPrimaryTextFormField(
                                    labelText: 'Password',
                                    obscureText: !isPasswordVisible,
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
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
                                  // CustomPrimaryTextFormField(
                                  //   labelText: 'Confirm password',
                                  //   obscureText: !isPasswordVisible,
                                  //   controller: passwordController,
                                  //   keyboardType: TextInputType.visiblePassword,
                                  //   textInputAction: TextInputAction.done,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       password = value;
                                  //     });
                                  //   },
                                  //   suffixWidget: IconButton(
                                  //     icon: Icon(
                                  //       isPasswordVisible
                                  //           ? Icons.visibility
                                  //           : Icons.visibility_off,
                                  //       color: Colors.grey.shade700,
                                  //     ),
                                  //     onPressed: togglePasswordVisibility,
                                  //   ),
                                  //   hintText: 'Re-enter your Password',
                                  // ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PrimaryButton(
                                    backgroundColor: Colors.blueGrey.shade900,
                                    onTap: () async {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      try {
                                        var newUser = await _auth
                                            .createUserWithEmailAndPassword(
                                                email: email,
                                                password: password);
                                        if (newUser != null) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const QrCodePage(),
                                                  ),
                                                  (route) => false);
                                        }

                                        setState(() {
                                          showSpinner = false;
                                        });
                                      } catch (e) {
                                        setState(() {
                                          showSpinner = false;
                                        });
                                  Alert(
                                    context: context,
                                    title: 'Sign up failed',
                                    desc: 'Incorrect Email or Password',
                                    buttons: [
                                      DialogButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        width: 200,
                                        color: Colors.blueGrey.shade900,
                                        child: const Text(
                                          'Try again',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ).show();
                                        print(e);
                                      }
                                    },
                                    child: const Text('Sign Up'),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  // Center(
                                  //   child: InkWell(
                                  //     onTap: () {
                                  //       Navigator.of(context).push(
                                  //           MaterialPageRoute(
                                  //               builder:
                                  //                   (BuildContext context) =>
                                  //                       const LoginPage()));
                                  //     },
                                  //     child: RichText(
                                  //       text: TextSpan(
                                  //         style: const TextStyle(
                                  //             color: Colors.black,
                                  //             fontSize: 13),
                                  //         children: <TextSpan>[
                                  //           const TextSpan(
                                  //               text:
                                  //                   'Already have an account? '),
                                  //           TextSpan(
                                  //             text: 'Sign In',
                                  //             style: TextStyle(
                                  //                 color:
                                  //                     Colors.blueGrey.shade900,
                                  //                 fontSize: 13,
                                  //                 fontWeight: FontWeight.w600,
                                  //                 decoration:
                                  //                     TextDecoration.underline),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
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
