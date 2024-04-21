// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/resources/authentication_methods.dart';
import 'package:quiz/bottom_nav.dart';
import 'package:quiz/screens/user_account/forgot_password.dart';
import 'package:quiz/screens/user_account/sign_up.dart';
import 'package:quiz/utils/app_dimensions.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  bool _isPasswordVisible = false;

  String email = "", password = "";

  @override
  void dispose() {
    _userController.text;
    _passwordController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: blackBG,
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppDimensions.screenHeight,
          width: AppDimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppDimensions.height100),
              Text(
                "Welcome !",
                style: TextStyle(
                  fontSize: AppDimensions.fontSize40,
                  color: whiteText,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: AppDimensions.height12),
              Text(
                "Please sign in to your account",
                style: TextStyle(
                  fontSize: AppDimensions.fontSize18,
                  color: grayText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.height60),

              // email field
              Container(
                height: AppDimensions.height70,
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.pHorizontal20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.pHorizontal30,
                ),
                decoration: BoxDecoration(
                  color: blackTextFild,
                  borderRadius: BorderRadius.circular(AppDimensions.radius20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppDimensions.width320,
                      child: TextFormField(
                        controller: _userController,
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

              // password field
              Container(
                height: AppDimensions.height70,
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.pHorizontal20,
                  vertical: AppDimensions.pVertical15,
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
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: !_isPasswordVisible
                          ? SvgPicture.asset(
                              "assets/icons/hide.svg",
                              height: AppDimensions.height25,
                              colorFilter: const ColorFilter.mode(
                                grayText,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              "assets/icons/visibility.svg",
                              height: AppDimensions.height25,
                              colorFilter: const ColorFilter.mode(
                                grayText,
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.height10),

              // forgot password
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: AppDimensions.width25),
                  child: GestureDetector(
                    onTap: () {
                      // forgot password function
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: AppDimensions.fontSize17,
                        color: grayText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.height60),

              // sign in button
              GestureDetector(
                onTap: () async {
                  String output = await authenticationMethods.signInUser(
                    userEmail: _userController.text,
                    userPassword: _passwordController.text,
                  );

                  if (output == "success") {
                    // doing next function
                    log("login success");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const BottomNavScreen(),
                      ),
                    );
                  } else {
                    final snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius10),
                      ),
                      content: Text(
                        output,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: AppDimensions.fontSize17,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  height: AppDimensions.height75,
                  width: screenSize.width,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.pHorizontal20),
                  decoration: BoxDecoration(
                    color: blueButton,
                    borderRadius: BorderRadius.circular(AppDimensions.radius15),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: AppDimensions.fontSize18,
                      color: whiteText,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppDimensions.height25),

              // google sign in button
              GestureDetector(
                onTap: () async {
                  await authenticationMethods.signInWithGoogle(context);
                },
                child: Container(
                  height: AppDimensions.height75,
                  width: screenSize.width,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.pHorizontal20),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(AppDimensions.radius15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        height: AppDimensions.height40,
                        width: AppDimensions.width62,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: AppDimensions.fontSize18,
                          color: blackBG,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.height90),

              // don't have an a account
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
                      " Sign Up",
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
    );
  }
}
