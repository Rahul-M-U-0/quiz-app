import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/screens/user_account/login_screen.dart';
import 'package:quiz/utils/app_dimensions.dart';

import 'swidgets/settings_container_row.dart';

class QuizAppSettingsScreen extends StatelessWidget {
  const QuizAppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: AppDimensions.screenHeight,
          width: AppDimensions.screenWidth,
          child: Column(
            children: [
              SizedBox(height: AppDimensions.height20),
              Container(
                height: AppDimensions.height100,
                margin: EdgeInsets.all(AppDimensions.height30),
                padding: EdgeInsets.all(AppDimensions.height10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(49, 49, 77, 1),
                  borderRadius: BorderRadius.circular(AppDimensions.radius30),
                ),
                child: Row(
                  children: [
                    LottieBuilder.asset("assets/animations/premium.json"),
                    SizedBox(width: AppDimensions.width20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Go Premium!",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: AppDimensions.fontSize18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          "Unlock All Questions!",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: AppDimensions.fontSize17,
                                color: Colors.grey,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // settings
              Container(
                height: AppDimensions.height200,
                width: double.infinity,
                margin:
                    EdgeInsets.symmetric(horizontal: AppDimensions.height30),
                padding: EdgeInsets.all(AppDimensions.padding20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.radius20),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SettingsContainerRow(
                      leadingIconUrl: "assets/icons/premium.png",
                      settingsText: "Premium",
                      trailingIcon: Icons.arrow_forward_ios,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.height50),
                      child: Divider(
                        height: 1,
                        color: Colors.black54,
                      ),
                    ),
                    SettingsContainerRow(
                      leadingIconUrl: "assets/icons/daily_questions.png",
                      settingsText: "Daily Questions",
                      trailingText: "20",
                      trailingIcon: Icons.arrow_forward_ios,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.height50),
                      child: Divider(
                        height: 1,
                        color: Colors.black54,
                      ),
                    ),
                    SettingsContainerRow(
                      leadingIconUrl: "assets/icons/score_goal.png",
                      settingsText: "Score Goal",
                      trailingText: "80%",
                      trailingIcon: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.height30),

              // rate us
              Container(
                height: AppDimensions.height140,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.pHorizontal30),
                padding: EdgeInsets.all(AppDimensions.padding20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.radius20),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SettingsContainerRow(
                      leadingIconUrl: "assets/icons/rate_us.png",
                      settingsText: "Rate us",
                      trailingIcon: Icons.arrow_forward_ios,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.height50),
                      child: Divider(
                        height: 1,
                        color: Colors.black54,
                      ),
                    ),
                    SettingsContainerRow(
                      leadingIconUrl: "assets/icons/share.png",
                      settingsText: "Share with a friend",
                      trailingIcon: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.height30),

              // reset progress
              Container(
                height: AppDimensions.height70,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.pHorizontal30),
                padding: EdgeInsets.all(AppDimensions.padding20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(AppDimensions.radius10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/round_arrow.png",
                      height: AppDimensions.height25,
                      width: AppDimensions.height25,
                    ),
                    SizedBox(width: AppDimensions.width10),
                    Text(
                      "Reset Progress",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: AppDimensions.fontSize20,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: AppDimensions.height15,
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppDimensions.height30),

              // sign out
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (ctx) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                child: Container(
                  height: AppDimensions.height70,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.pHorizontal30),
                  padding: EdgeInsets.all(AppDimensions.padding20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radius10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/logout.png",
                        height: AppDimensions.height40,
                        width: AppDimensions.height40,
                      ),
                      SizedBox(width: AppDimensions.width10),
                      Text(
                        "Sign Out",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: AppDimensions.fontSize20,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: AppDimensions.height15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
