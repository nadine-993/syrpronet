
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/model/providers/buttonProvider.dart';
import '../../../networking/constants.dart';
import '../../../widgets/textInfoCreateAccount.dart';
import '../../navigation.dart';



class createProject extends StatefulWidget {
  final String uid;
  createProject({Key? key, required this.uid}) : super(key: key);
  @override
  State<createProject> createState() => _createProjectState();
}
class _createProjectState extends State<createProject> {
  String userFullName = '';
  String  userTitle= '';
  String userEmail='';


  String userId = FirebaseAuth.instance.currentUser!.uid;
  void initState() {

    super.initState();
    fetchUserData();
  }
  Future<void> fetchUserData() async {
    try {
      if (userId.isNotEmpty) { // Check if widget.uid is not empty
        // Access the Firestore instance
        final FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Reference to the "users" collection and the specific user document
        final DocumentReference userRef = firestore.collection('Users').doc(userId);

        // Fetch the user's data
        final DocumentSnapshot userSnapshot = await userRef.get();

        if (userSnapshot.exists) {
          final userData = userSnapshot.data() as Map<String, dynamic>;

          // Now you can access user data and set it in your state
          final fullName = userData['fullname'] as String;

          final Title = userData['title'] as String;
          final email = userData['emailadress'] as String;


          print('name = $fullName');

          // Set the user data in your state or widgets
          setState(() {
            userFullName = fullName;

            userTitle=Title;
            userEmail= email;

          });
        } else {
          print('User document does not exist for uid: ${userId}');
        }
      } else {
        print('widget.uid is empty or null');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override

  final projectName = TextEditingController();
  final projectSector = TextEditingController();
  final projectDescription = TextEditingController();
  String dropdownvalue= "Initial idea";
  String supportvalue="Advisory";

  @override
  Widget build(BuildContext context) {

    CollectionReference collRef =
    FirebaseFirestore.instance.collection('projectRequest');
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Tell us about your project',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: 'MontserratBold',
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Full Name '),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          controller: projectName,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Full Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Sector'),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          controller: projectSector,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Sector',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your sector';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Phase'),
                        SizedBox(
                          height: height * .01,
                        ),

                        DropdownButton(
                          hint: Text('Phase'),
                          isExpanded: true,
                          itemHeight: 70,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Initial Value
                          value: dropdownvalue,

                          // Array list of items
                          items: projectPhase.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },

                        ),

                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Description '),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(500),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          maxLines: 5,
                          controller: projectDescription,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Project description',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),


                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Support '),
                        SizedBox(
                          height: height * .02,
                        ),
                        DropdownButton(
                          hint: Text('Phase'),
                          isExpanded: true,
                          itemHeight: 70,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Initial Value
                          value: supportvalue,

                          // Array list of items
                          items: projectSupport.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              supportvalue = newValue!;
                            });
                          },

                        ),

                        SizedBox(
                          height: height * .03,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width * .4,
                              height: height * .06,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateColor.resolveWith(
                                          (states) => Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  '< Back',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kFontStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .4,
                              height: height * .06,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      kPrimaryColor),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsets>(
                                      const EdgeInsets.all(15)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Get the current user
                                  User? currentUser = FirebaseAuth.instance.currentUser;

                                  if (currentUser != null) {
                                    String uid = currentUser.uid;

                                    if (projectName.text.isEmpty ||
                                        projectSector.text.isEmpty ||
                                        projectPhase.isEmpty ||
                                        projectDescription.text.isEmpty ||
                                        projectSupport.isEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Container(
                                            height: 70,
                                            child: const Column(
                                              children: [
                                                Text(
                                                  'Please fill in all fields before sending.',
                                                  style: TextStyle(
                                                    fontFamily: kFontStyle,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      // All fields are filled, proceed with storing data
                                      DocumentReference userRef = collRef.doc();
                                      // Store the user data in the document
                                      userRef.set({
                                        'project name': projectName.text,
                                        'project sector': projectSector.text,
                                        'timestamp': FieldValue.serverTimestamp(),
                                        'project phase': dropdownvalue,
                                        'project description': projectDescription.text,
                                        'syrpro support': supportvalue,
                                        'username': userFullName,
                                        'title': userTitle,
                                        'useremail': userEmail,
                                      });

                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Container(
                                            height: 70,
                                            child: const Column(
                                              children: [
                                                Text(
                                                  'Thank you for trusting us with your project we will review it and contact you in person.',
                                                  style: TextStyle(
                                                    fontFamily: kFontStyle,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [

                                            TextButton(

                                              onPressed: () {
                                               Navigator.pop(context);
                                               projectName.clear();
                                               dropdownvalue = "Initial idea";
                                               projectDescription.clear();
                                               projectSector.clear();
                                               supportvalue= "Advisory";

                                              },
                                              child: const Text('ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }
                                },


                                child: const Text(
                                  'Send >',
                                  style: TextStyle(
                                    fontFamily: kFontStyle,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
