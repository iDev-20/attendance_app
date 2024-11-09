// ignore_for_file: unused_field

import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/form_fields.dart';
import 'package:attendance_app/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String password = '';

  late String _email;
  late String _password;

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
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('images/background_image.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
              ),
            ),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Merriweather',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(85))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 55.0, right: 40.0),
                      child: Form(
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
                              onSaved: (value) => _email = value!,
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
                              onSaved: (value) => _password = value!,
                            ),
                            CustomPrimaryTextFormField(
                              labelText: 'Confirm password',
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
                              hintText: 'Re-enter your Password',
                              onSaved: (value) => _password = value!,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PrimaryButton(
                              backgroundColor: Colors.blueGrey.shade900,
                              onTap: () {
                                // FocusManager.instance.primaryFocus?.unfocus();
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         const QrCodePage()));
                              },
                              child: const Text('Sign Up'),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginPage()));
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text:
                                              'Already have an account? '),
                                      TextSpan(
                                        text: 'Sign In',
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade900,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
