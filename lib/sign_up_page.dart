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
                image: const AssetImage('images/sample_image2.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 16, top: 100, right: 16, bottom: 100),
                      child: Text(
                        'Class Control',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Merriweather',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PrimaryTextFormField(
                                      labelText: 'Email',
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      prefixWidget: Icon(
                                        Icons.email_outlined,
                                        color: Colors.grey.shade700,
                                      ),
                                      hintText: 'example@gmail.com',
                                      onSaved: (value) => _email = value!,
                                    ),
                                    PrimaryTextFormField(
                                      labelText: 'Pasword',
                                      obscureText: !isPasswordVisible,
                                      controller: passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      prefixWidget: Icon(
                                        Icons.lock_outline_rounded,
                                        color: Colors.grey.shade700,
                                      ),
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
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              PrimaryButton(
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
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const LoginPage()));
                                  },
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Already have an account? '),
                                        TextSpan(
                                          text: 'Login',
                                          style: TextStyle(
                                              color: Colors.blue,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
