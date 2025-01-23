import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Functions.dart';
import '../networking/constants.dart';
import '../screens/event/eventDetails.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('Events').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return AnimationLimiter(
                  child: ListView(
                    children: snapshot.data!.docs.map((doc) {
                      // Fetch the image URL for the event
                      String imageUrl = doc.data()['image'];

                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.04),
                        child: Container(
                          height: height * 0.4,
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
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl), // Use the fetched image URL
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                Text(
                                  doc.data()['Event name'],
                                  style: const TextStyle(
                                      fontFamily: kFontStyleBold, fontSize: 20),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          doc.data()['Event Location'],
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: kFontStyle),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time_sharp,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          doc.data()['Event Time'],
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: kFontStyle),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.black),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetails(doc: doc),
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
                    }).toList(),
                  ));
            }
          }),
    );
  }
}
