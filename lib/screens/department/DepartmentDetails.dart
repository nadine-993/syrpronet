import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../networking/constants.dart';
import '../../widgets/CustomAppBarCard.dart';
import '../../widgets/textWrapper.dart';

class DepartmentDetailsScreen extends StatefulWidget {
  final String departmentId;

  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
   DepartmentDetailsScreen({required this.departmentId, required this.doc});

  @override
  State<DepartmentDetailsScreen> createState() => _DepartmentDetailsScreenState();
}

class _DepartmentDetailsScreenState extends State<DepartmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String imageUrl = widget.doc['image'];
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Departments')
            .doc(widget.departmentId)
            .collection('department details') // Replace with your subcollection name
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Placeholder for loading state
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No data available'); // Handle empty data
          }


          // Display subcollection information
          return ListView.builder(

            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final subcollectionData = snapshot.data!.docs[index];
              // Access the fields within each document of the subcollection
              final departmentManager = subcollectionData['manager'];
              final depstrategy = subcollectionData['strategy'];
              final depmissionandvision = subcollectionData['mission and vision'];

              // Display the subcollection data in your UI
              return  Column(
                children: [
                  CustomAppBarCard(title:'Department Details'),
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

                                SizedBox(
                                  height: height * 0.03,
                                ),
                                const Text(
                                  'Department Manager',
                                  style: TextStyle(
                                    fontFamily: kFontStyleBold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                 ListTile(
                                  title: Text(
                                      departmentManager,
                                    style: TextStyle(
                                      fontFamily: kFontStyle,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                const Text(
                                  'Mission & vision',
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
                                    text: depmissionandvision,

                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text(
                                  'Strategy',
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
                                    text: depstrategy,

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
              );

                // Customize the UI to display the subcollection data

            },
          );
        },
      ),
    );
  }
}
