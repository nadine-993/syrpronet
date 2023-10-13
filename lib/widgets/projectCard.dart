import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../networking/constants.dart';
import '../screens/project/projectDetails.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder <QuerySnapshot <Map<String, dynamic>>> (
        stream: FirebaseFirestore.instance.collection('Projects').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return AnimationLimiter(
              child: ListView(
                children: snapshot.data!.docs.map((doc)  {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.01,
                          right: width * 0.02,
                          bottom: height * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: height * 0.15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.red,
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/projectCard.png',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text(doc.data()['Project Manager'],
                                style: const TextStyle(
                                    color: kGrayColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kFontStyle),
                              ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                    width * 0.02,
                                    height * 0.007,
                                    width * 0.02,
                                    height * 0.007,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent.shade100,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    children: [Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.greenAccent.shade700,
                                    ),
                                      Text(
                                        doc.data()['Project status'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: kFontStyle,
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              doc.data()['Project name'],
                              style: const TextStyle(
                                  fontFamily: kFontStyleBold, fontSize: 20),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              doc.data()['Project Description'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: kFontStyle,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProjectDetails(doc: doc),
                                  ),
                                );
                              },
                              child: const Text(
                                'More Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kFontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } ).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
