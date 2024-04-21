// ignore_for_file: unused_import

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/utils/app_dimensions.dart';

class HeaderContainerContent extends StatefulWidget {
  const HeaderContainerContent({
    super.key,
  });

  @override
  State<HeaderContainerContent> createState() => _HeaderContainerContentState();
}

class _HeaderContainerContentState extends State<HeaderContainerContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: AppDimensions.height15,
          right: AppDimensions.width25,
          child: Container(
            height: AppDimensions.height60,
            width: AppDimensions.height60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/images/user_dp/male-dp.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("usersdata")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            } else {
              return Positioned(
                top: AppDimensions.height15,
                left: AppDimensions.width20,
                child: Text(
                  "Hi ${snapshot.data!["username"]} !",
                  style: TextStyle(
                    fontSize: AppDimensions.fontSize22,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              );
            }
          },
        ),
        Positioned(
          top: AppDimensions.height25,
          right: -AppDimensions.width55,
          child: LottieBuilder.asset(
            "assets/animations/anime.json",
            height: AppDimensions.height350,
            width: AppDimensions.width280,
          ),
        ),
        Positioned(
          top: AppDimensions.height80,
          left: AppDimensions.width20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Challenge your friends",
                style: TextStyle(
                  fontSize: AppDimensions.fontSize28,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: AppDimensions.height10),
              Text(
                "invite your friends to play\nquiz game",
                style: TextStyle(
                  fontSize: AppDimensions.fontSize18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: AppDimensions.height20),
              MaterialButton(
                textColor: Colors.black,
                color: Color.fromRGBO(240, 235, 229, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.radius10),
                  ),
                ),
                onPressed: () {
                  // function will be here
                  log("start now button presses..!");
                },
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.padding10),
                  child: Text(
                    "Start Now",
                    style: TextStyle(
                      fontSize: AppDimensions.fontSize17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
