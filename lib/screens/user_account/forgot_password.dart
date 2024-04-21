// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/resources/authentication_methods.dart';
import 'package:quiz/screens/user_account/login_screen.dart';
import 'package:quiz/screens/user_account/sign_up.dart';
import 'package:quiz/utils/app_dimensions.dart';

import '../../utils/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  void dispose() {
    _emailController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: SizedBox(
        height: AppDimensions.screenHeight,
        width: AppDimensions.screenWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: AppDimensions.height120),
            child: Column(
              children: [
                Text(
                  "Password Recovery !",
                  style: TextStyle(
                    fontSize: AppDimensions.fontSize35,
                    color: whiteText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: AppDimensions.height10),
                Text(
                  "Enter your email",
                  style: TextStyle(
                    fontSize: AppDimensions.fontSize18,
                    color: whiteText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppDimensions.height50),
                // email field
                Container(
                  height: AppDimensions.height70,
                  margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.pHorizontal20,
                    vertical: AppDimensions.pVertical10,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.pHorizontal30),
                  decoration: BoxDecoration(
                    color: blackTextFild,
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: AppDimensions.width320,
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            hintStyle: TextStyle(
                              fontSize: AppDimensions.fontSize18,
                              color: grayText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: AppDimensions.fontSize18,
                            color: whiteText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/user.svg",
                        height: AppDimensions.height25,
                        colorFilter: const ColorFilter.mode(
                          grayText,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.height10),
                GestureDetector(
                  onTap: () async {
                    // sign in function
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       backgroundColor: Colors.orangeAccent,
                    //       margin: EdgeInsets.symmetric(
                    //         horizontal: 10.0,
                    //         vertical: 10.0,
                    //       ),
                    //       behavior: SnackBarBehavior.floating,
                    //       content: Text(
                    //         "Invalid email",
                    //         style: TextStyle(
                    //           fontSize: 16.0,
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // }

                    String output = await authenticationMethods
                        .userForgotPassword(userEmail: _emailController.text);

                    if (output == "success") {
                      final snackBar = SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radius10),
                        ),
                        backgroundColor: Colors.teal,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Reset link has been sent",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: AppDimensions.fontSize17,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // goto login screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const LoginScreen(),
                        ),
                      );
                    } else {
                      final snackBar = SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radius10),
                        ),
                        backgroundColor: Colors.teal,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          output,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: AppDimensions.fontSize17,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    height: AppDimensions.height70,
                    width: AppDimensions.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: AppDimensions.pHorizontal20),
                    decoration: BoxDecoration(
                      color: blueButton,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radius20),
                    ),
                    child: Text(
                      "Send Email",
                      style: TextStyle(
                        fontSize: AppDimensions.fontSize18,
                        color: whiteText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: AppDimensions.fontSize18,
                        color: whiteText,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // sign up page
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        " Create",
                        style: TextStyle(
                          fontSize: AppDimensions.fontSize18,
                          color: blueText,
                          fontWeight: FontWeight.w800,
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
