import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/providers/buttonProvider.dart';
import '../../model/providers/informationProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/CustomAppBarCard.dart';
import '../../widgets/textWrapper.dart';

class ProjectDetails extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  const ProjectDetails({Key? key, required this.doc}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String imageUrl = widget.doc['image'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimationLimiter(
        child: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: () async {
            Provider.of<InformationProvider>(context, listen: false).internetAccess();
            if (!Provider.of<InformationProvider>(context, listen: false).internetAccessB!) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: const Text(
                    'Please check your internet access',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: kFontStyle,
                    ),
                  ),
                  actions: <Widget>[
                    Center(
                      child: SizedBox(
                        width: width * 0.6,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Ok'),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            print(Provider.of<InformationProvider>(context, listen: false).internetAccess);
          },
          child: ListView(
            children: [
              const CustomAppBarCard(title: 'Project Details'),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: height! * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.25),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                                left: width * 0.02,
                                right: width * 0.02,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.doc['Project name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: kFontStyle,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.greenAccent.shade700,
                                      ),
                                      Text(
                                        widget.doc['Project status'],
                                        style: const TextStyle(
                                          fontFamily: kFontStyle,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            const Text(
                              'Project Manager',
                              style: TextStyle(
                                fontFamily: kFontStyleBold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            ListTile(

                              title: Text(
                                widget.doc['Project Manager'],
                                style: const TextStyle(
                                  fontFamily: kFontStyle,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                widget.doc['Manager Title'],
                                style: const TextStyle(
                                  color: kGrayColor,
                                  fontFamily: kFontStyle,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),

                            const Text(
                              'Project Description',
                              style: TextStyle(
                                fontFamily: kFontStyleBold,
                                fontSize: 20,
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
                              child: TextWrapper(
                                text: widget.doc['Project Description'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
