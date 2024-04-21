// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/resources/authentication_methods.dart';
import 'package:quiz/screens/user_account/login_screen.dart';
import 'package:quiz/utils/app_dimensions.dart';
import 'package:quiz/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // String name = "", email = "", password = "";

  // controller
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.text;
    _emailController.text;
    _passwordController.text;
    _confirmPasswordController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppDimensions.screenHeight,
          width: AppDimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppDimensions.height40),

              // create account text
              Text(
                "Create new account",
                style: TextStyle(
                  fontSize: AppDimensions.fontSize35,
                  color: whiteText,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: AppDimensions.height12),
              Text(
                "Please fill in the form to continue",
                style: TextStyle(
                  fontSize: AppDimensions.fontSize18,
                  color: grayText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.height60),

              // full name field
              Container(
                height: AppDimensions.height70,
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.pHorizontal20,
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
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
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

              // email field
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email Address",
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
                      child: _isPasswordVisible
                          ? SvgPicture.asset(
                              "assets/icons/visibility.svg",
                              height: AppDimensions.height25,
                              colorFilter: const ColorFilter.mode(
                                grayText,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              "assets/icons/hide.svg",
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

              // confirm password
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
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",
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
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      child: _isConfirmPasswordVisible
                          ? SvgPicture.asset(
                              "assets/icons/visibility.svg",
                              height: AppDimensions.height25,
                              colorFilter: const ColorFilter.mode(
                                grayText,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              "assets/icons/hide.svg",
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

              SizedBox(height: AppDimensions.height40),
              // sign in button
              GestureDetector(
                onTap: () async {
                  String password = _passwordController.text;
                  String confirmP = _confirmPasswordController.text;

                  if (password == confirmP) {
                    String output = await authenticationMethods.signUpUser(
                      userName: _usernameController.text,
                      userEmail: _emailController.text,
                      userPassword: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                    );

                    if (output == "success") {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => LoginScreen(),
                        ),
                      );
                    } else {
                      final snackBar = SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
                  } else {
                    final snackBar = SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.teal,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "Passwords do not match",
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
                  width: AppDimensions.screenWidth,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.pHorizontal20),
                  decoration: BoxDecoration(
                    color: blueButton,
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: AppDimensions.fontSize18,
                      color: whiteText,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.height20),

              // google sign in button
              GestureDetector(
                onTap: () async {
                  // sign in function
                  await authenticationMethods.signInWithGoogle(context);
                },
                child: Container(
                  height: AppDimensions.height70,
                  width: AppDimensions.screenWidth,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.pHorizontal20),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
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
                        "Sign in with google",
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
              SizedBox(height: AppDimensions.height60),

              // already have an a account
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
                      // login page
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      " Login",
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
