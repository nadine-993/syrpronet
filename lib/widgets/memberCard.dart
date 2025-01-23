import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import '../../networking/constants.dart';
import '../model/providers/informationProvider.dart';
import '../screens/members/memberScreen.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('Members').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return AnimationLimiter(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  var imageUrl = doc.data()['image']; // Fetch the image URL from Firestore

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  ),
                                ],
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 CircleAvatar(
                                  radius: 40, // Adjust the radius as needed
                                  backgroundImage: NetworkImage(imageUrl),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      doc.data()['Member name'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: kFontStyleBold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      doc.data()['Member department'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kFontStyle,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
