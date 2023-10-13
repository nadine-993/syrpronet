import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import '../../networking/constants.dart';
import '../model/providers/informationProvider.dart';
import '../screens/department/memberScreen.dart';

class DepartmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('Departments').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return AnimationLimiter(
              child: ListView(
            children: snapshot.data!.docs.map((doc){

    return  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MembersScreen(
                              title: 'department',
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: height * 0.15,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/imageAssets/departments/1.jpg'),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.04, height * 0.04, 0, 0),
                              decoration: const BoxDecoration(
                                color: const Color(0xbf323f4b),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( doc.data()['Department name'],

                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: kFontStyleBold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                   Text(
                                    "+ ${doc.data()['Members'].toString()} Members",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: kFontStyle,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    );
        }).toList()
              ),
            );}
        },
      ),
    );
  }
}
