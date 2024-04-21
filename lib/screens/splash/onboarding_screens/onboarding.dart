import 'package:flutter/material.dart';
import 'package:quiz/screens/user_account/login_screen.dart';
import 'package:quiz/screens/splash/onboarding_screens/onboard_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.all(screenSize.height * 0.042),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.084,
                          ),
                          Image.asset(
                            contents[i].image,
                            height: screenSize.height * 0.38,
                          ),
                          SizedBox(height: screenSize.height * 0.032),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w700,
                              fontSize: screenSize.height * 0.036,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.015),
                          Expanded(
                            child: Text(
                              contents[i].desc,
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w500,
                                fontSize: screenSize.height * 0.022,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: EdgeInsets.all(screenSize.height * 0.032),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    screenSize.height * 0.052,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.2,
                                  vertical: screenSize.height * 0.026,
                                ),
                                textStyle: TextStyle(
                                  fontSize: screenSize.height * 0.016,
                                ),
                              ),
                              child: const Text(
                                "START",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(screenSize.height * 0.031),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _controller.jumpToPage(2);
                                  },
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.height * 0.018,
                                    ),
                                  ),
                                  child: const Text(
                                    "SKIP",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenSize.width * 0.067,
                                      vertical: screenSize.height * 0.026,
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: screenSize.height * 0.016,
                                    ),
                                  ),
                                  child: const Text(
                                    "NEXT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
