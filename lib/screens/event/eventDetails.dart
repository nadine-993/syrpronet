import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

import '../../Functions.dart';
import '../../networking/constants.dart';
import '../../widgets/CustomAppBarCard.dart';
import '../../widgets/textWrapper.dart';

class EventDetails extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  const EventDetails({Key? key, required this.doc}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Fetch the image URL for the event from the Firestore document
    String imageUrl = widget.doc['image'];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
          // Your refresh logic here
        },
        child: SafeArea(
          child: ListView(
            children: [
              const CustomAppBarCard(title: 'Event Details'),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl), // Use the fetched image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    height: height * 0.3,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xbf323f4b),
                      ),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.25),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.01, top: height * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.125),
                              child:  Text(
                                widget.doc['Event name'],
                                style: const TextStyle(
                                    fontFamily: kFontStyleBold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                width: width * 0.1,
                                height: height * 0.05,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/clock (1).svg',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              title: Text(
                                widget.doc['Event Time'],
                                style: const TextStyle(
                                    fontFamily: kFontStyle,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle:  Text(
                                widget.doc['Event Time'],

                                style: const TextStyle(
                                    color: kGrayColor,
                                    fontFamily: kFontStyle,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                width: width * 0.1,
                                height: height * 0.05,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/location-grad.svg',
                                  ),
                                ),
                              ),
                              title:  Text(
                                widget.doc['Event Location'],
                                style: const TextStyle(
                                    fontFamily: kFontStyle,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),

                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: const Text(
                                'Attendees:',
                                style: TextStyle(
                                  fontFamily: kFontStyleBold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.04,
                                  right: width * 0.04,
                                ),
                                child:  TextWrapper(
                                  text:
                                  widget.doc['Attendees'],
                                )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: const Text(
                                'Host',
                                style: TextStyle(
                                  fontFamily: kFontStyleBold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(

                              title: Text(
                                widget.doc['Event Host'],
                                style:const  TextStyle(
                                    fontFamily: kFontStyle,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                widget.doc['Speaker Title'],
                                style: const TextStyle(
                                    color: kGrayColor,
                                    fontFamily: kFontStyle,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: const Text(
                                'Join Us Via',
                                style: TextStyle(
                                  fontFamily: kFontStyleBold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  SvgPicture.asset('assets/icons/video.svg'),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                      widget.doc['Event Link'])
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}