// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/option_ptovider.dart';
import 'package:quiz/screens/home/home_screen.dart';
import 'package:quiz/screens/quiz_status/quiz_stats.dart';
import 'package:quiz/screens/settings/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final screensList = <Widget>[
    QuizHomeScreen(),
    QuizAppStatsScreen(),
    QuizAppSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 49, 77, 1),
      body: screensList.elementAt(selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        index: selectedIndex,
        color: Color.fromRGBO(49, 49, 77, 1),
        backgroundColor: Color.fromRGBO(247, 246, 242, 1),
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.bar_chart,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}


 // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromRGBO(49, 49, 77, 1),
      //   // backgroundColor: Colors.white,
      //   // // selectedItemColor: Color.fromRGBO(49, 49, 77, 1),
      //   selectedItemColor: Colors.white,
      //   // selectedItemColor: Color.fromRGBO(49, 49, 77, 1),
      //   selectedFontSize: 16,
      //   selectedLabelStyle: TextStyle(
      //     fontWeight: FontWeight.w800,
      //   ),
      //   currentIndex: selectedIndex,
      //   onTap: (newIndex) {
      //     setState(() {
      //       selectedIndex = newIndex;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Iconsax.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Iconsax.status_up4),
      //       label: "Stats",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: "Settings",
      //     ),
      //   ],
      // ),