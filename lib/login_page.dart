// ignore_for_file: unused_field

import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/form_fields.dart';
import 'package:attendance_app/sign_up_page.dart';
import 'package:attendance_app/qr_code_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  // void login() {
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();

  //   // Placeholder logic for login authentication
  //   if (email == 'lecturer@example.com' && password == 'password123') {
  //     // Navigate to the next page if credentials are correct
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (BuildContext context) => const QrCodePage()));
  //   } else {
  //     // Display an error message if credentials are incorrect
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Invalid email or password')),
  //     );
  //   }
  // }

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
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 16, top: 100, right: 16, bottom: 100),
                  child: Center(
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
                SingleChildScrollView(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(85))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 55.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Login to your account',
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
                                  labelText: 'Email',
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: 'example@gmail.com',
                                  onSaved: (value) => _email = value!,
                                ),
                                CustomPrimaryTextFormField(
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
                            backgroundColor: Colors.blueGrey.shade900,
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const QrCodePage()));
                            },
                            child: const Text('Login'),
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
                                            const SignUpPage()));
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13),
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Don\'t have an account? '),
                                    TextSpan(
                                      text: 'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
