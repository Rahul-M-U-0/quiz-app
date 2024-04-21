// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/screens/questions/choose_level.dart';
import 'package:quiz/utils/app_dimensions.dart';
import 'widget/header_container.dart';
import 'widget/header_container_content.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  late List<String> catagory = [];

  Future getDocIds() async {
    catagory = [];

    final snapshot =
        await FirebaseFirestore.instance.collection("category").get();

    for (final document in snapshot.docs) {
      catagory.add(document.reference.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: AppDimensions.screenHeight,
          width: AppDimensions.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainer(
                child: HeaderContainerContent(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.padding25,
                  bottom: AppDimensions.padding20,
                ),
                child: Text(
                  "Explore By Categories",
                  style: TextStyle(
                    fontSize: AppDimensions.fontSize20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              // appDimension will start from here.
              // quiz catelog

              Expanded(
                child: FutureBuilder(
                  future: getDocIds(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (catagory.isNotEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 25,
                                mainAxisExtent: 200,
                              ),
                              itemCount: catagory.length,
                              itemBuilder: (context, index) {
                                return StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("category")
                                      .doc(catagory[index])
                                      .snapshots(),
                                  builder: (context, csnapshot) {
                                    if (csnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const SizedBox();
                                    } else {
                                      if (csnapshot.hasData) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChooseLevelScreen(
                                                  categoryId: catagory[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                // color: Color.fromRGBO(247, 246, 242, 1),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    height: 110,
                                                    child: Image.network(
                                                        csnapshot
                                                            .data!['image']),
                                                  ),
                                                  Text(
                                                    csnapshot.data!['name'],
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Add Category"),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 25, right: 25),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => ChooseLevelScreen(),
              //         ),
              //       );
              //     },
              //     child: Material(
              //       elevation: 5,
              //       borderRadius: BorderRadius.circular(10),
              //       child: Container(
              //         height: 185,
              //         width: MediaQuery.of(context).size.width * 0.4,
              //         decoration: BoxDecoration(
              //           // color: Color.fromRGBO(247, 246, 242, 1),
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             SizedBox(
              //               height: 110,
              //               child: Image.asset(
              //                 "assets/images/quiz_category_image/sports.jpg",
              //               ),
              //             ),
              //             Text(
              //               "Sports",
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w700,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
