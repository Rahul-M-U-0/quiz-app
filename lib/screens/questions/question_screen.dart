// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/bottom_nav.dart';
import 'package:quiz/provider/option_ptovider.dart';
import 'package:quiz/screens/questions/score_screen.dart';
import 'package:quiz/utils/app_dimensions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.categoryId,
    required this.level,
  });

  final String categoryId;
  final String level;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  PageController controller = PageController();

  int score = 0;

  Widget allQuiz() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("category")
          .doc(widget.categoryId)
          .collection(widget.level)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        return snapshot.hasData
            ? PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data!.docs[index];

                  return Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Consumer<ClickOption>(
                            builder: (context, providerValue, child) {
                              return SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: AppDimensions.height20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Question ${index + 1} of ${snapshot.data!.docs.length}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize:
                                                    AppDimensions.fontSize18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          "30 Seconds",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize:
                                                    AppDimensions.fontSize18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: AppDimensions.height10),
                                    Text(
                                      ds["question"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: AppDimensions.fontSize28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          ds["image"],
                                          fit: BoxFit.cover,
                                          height: 300,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!providerValue.show) {
                                          providerValue.toTrue();
                                          if (ds['correct'] == ds["option1"]) {
                                            score += 1;
                                          }
                                        } else {
                                          final snackBar = SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: Colors.teal,
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              "Alredy choosed an answer",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: AppDimensions
                                                        .fontSize17,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: providerValue.show
                                          ? Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: ds['correct'] ==
                                                          ds["option1"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option1"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: Colors.black45,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option1"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!providerValue.show) {
                                          providerValue.toTrue();
                                          if (ds['correct'] == ds["option2"]) {
                                            score += 1;
                                          }
                                        } else {
                                          final snackBar = SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: Colors.teal,
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              "Alredy choosed an answer",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: AppDimensions
                                                        .fontSize17,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: providerValue.show
                                          ? Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: ds['correct'] ==
                                                          ds["option2"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option2"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: Colors.black45,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option2"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!providerValue.show) {
                                          providerValue.toTrue();
                                          if (ds['correct'] == ds["option3"]) {
                                            score += 1;
                                          }
                                        } else {
                                          final snackBar = SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: Colors.teal,
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              "Alredy choosed an answer",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: AppDimensions
                                                        .fontSize17,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: providerValue.show
                                          ? Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: ds['correct'] ==
                                                          ds["option3"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option3"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: Colors.black45,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option3"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!providerValue.show) {
                                          providerValue.toTrue();
                                          if (ds['correct'] == ds["option4"]) {
                                            score += 1;
                                          }
                                        } else {
                                          final snackBar = SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: Colors.teal,
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              "Alredy choosed an answer",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: AppDimensions
                                                        .fontSize17,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: providerValue.show
                                          ? Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: ds['correct'] ==
                                                          ds["option4"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option4"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: AppDimensions.height60,
                                              width: AppDimensions.screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.radius10),
                                                border: Border.all(
                                                  color: Colors.black45,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ds["option4"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (providerValue.show) {
                                              if (index ==
                                                  snapshot.data!.docs.length -
                                                      1) {
                                                // timer!.cancel();
                                                providerValue.toFalse();

                                                submit(
                                                    snapshot.data!.docs.length);
                                              } else {
                                                // timer!.cancel();
                                                controller.nextPage(
                                                    duration: Duration(
                                                        microseconds: 200),
                                                    curve: Curves.easeIn);

                                                providerValue.toFalse();
                                              }
                                            } else {
                                              final snackBar = SnackBar(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                backgroundColor: Colors.teal,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                  "Choose an answer",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: AppDimensions
                                                            .fontSize17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    49, 49, 77, 1),
                                                borderRadius:
                                                    BorderRadius.circular(60)),
                                            child: Center(
                                              child: index ==
                                                      snapshot.data!.docs
                                                              .length -
                                                          1
                                                  ? Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: Colors.white,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                    ),
                  );
                },
              )
            : Expanded(
                child: Container(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 49, 77, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    "Do you realy want to quit?",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Consumer<ClickOption>(
                                      builder: (context, providerValue, child) {
                                        return TextButton(
                                          onPressed: () {
                                            providerValue.toFalse();
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BottomNavScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${widget.categoryId} - ${widget.level}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: allQuiz(),
            ),
          ],
        ),
      ),
    );
  }

  void submit(int total) async {
    FirebaseFirestore.instance
        .collection("usersdata")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("attempts")
        .doc("${widget.categoryId}${widget.level}")
        .set({
      'category': widget.categoryId,
      'level': widget.level,
      'score': score,
      'total': total,
    }).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            category: widget.categoryId,
            level: widget.level,
          ),
        ),
      ),
    );
  }
}
