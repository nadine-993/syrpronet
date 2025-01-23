
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/model/providers/buttonProvider.dart';
import '../../model/providers/listProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/textInfoCreateAccount.dart';
import '../navigation.dart';


class CreateAccountStep1 extends StatefulWidget {
  CreateAccountStep1({Key? key}) : super(key: key);
  @override
  State<CreateAccountStep1> createState() => _CreateAccountStep1State();
}
class _CreateAccountStep1State extends State<CreateAccountStep1> {

  @override

  void initState() {

    super.initState();
  }
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  final countryController = TextEditingController();
  final bioController = TextEditingController();
  final linkedinController = TextEditingController();
  String value= "Executive Office";
  String rolevalue= "Advisor";




  @override
  Widget build(BuildContext context) {

    CollectionReference collRef =
    FirebaseFirestore.instance.collection('Users');
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
                  'Tell us about you',
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
                          controller: fullNameController,
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
                        const TextInfo(text: 'Email Address '),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email address',
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
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Title'),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Title',
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
                              return 'Please enter your title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * .03,
                        ),

                        const TextInfo(text: 'Role'),
                        SizedBox(
                          height: height * .01,
                        ),
                        DropdownButton(

                          hint: Text('Role'),
                          isExpanded: true,
                          itemHeight: 70,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Initial Value
                          value: rolevalue,

                          // Array list of items
                          items: roleList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              rolevalue = newValue!;
                            });
                          },

                        ),

                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Sector '),
                        SizedBox(
                          height: height * .01,
                        ),
                        DropdownButton(

                          hint: Text('Sector'),
                          isExpanded: true,
                          itemHeight: 70,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Initial Value
                          value: value,

                          // Array list of items
                          items: sectorlist.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              value = newValue!;
                            });
                          },

                        ),

                        SizedBox(
                          height: height * .03,
                        ),
                        const Text('Country',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: width * .03,
                            ),
                            SizedBox(
                              height: height * 0.07,
                              width: width * 0.7,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                controller: countryController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Country',
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
                                    return 'Please enter your Country';
                                  }
                                  return null;
                                },
                              ),

                            ),

                          ],
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Bio '),
                        SizedBox(
                          height: height * .02,
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
                          controller: bioController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Bio',
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
                          height: height * .02,
                        ),
                        const TextInfo(text: 'LinkedIn Account'),
                        SizedBox(
                          height: height * .02,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: linkedinController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'URL',
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
                                    User? currentUser = FirebaseAuth.instance
                                        .currentUser;

                                    if (currentUser != null) {
                                      String uid = currentUser.uid;

                                      // Reference to the "Users" collection and the document with the user's UID
                                      DocumentReference userRef = collRef.doc(
                                          uid);
                                      // Store the user data in the document
                                      userRef.set({
                                        'fullname': fullNameController.text,
                                        'emailadress': emailController.text,
                                        'title': titleController.text,
                                        'role': rolevalue,
                                        'sector': value,
                                        'country': countryController
                                            .text,
                                        'bio': bioController.text,
                                        'linkedin': linkedinController.text,
                                      }).then((value) {
                                        print(
                                            "User data stored successfully with ID: $uid");
                                      }).catchError((error) {
                                        print(
                                            "Failed to store user data: $error");
                                      });

                                      // Navigate to the next screen
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Navigation(uid: uid),
                                          ));
                                    } else {
                                      // Handle the case when the user is not logged in
                                    }

                                  },


                                child: const Text(
                                  'Create >',
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
