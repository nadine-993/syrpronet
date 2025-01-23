import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Functions.dart';
import '../../WelcomeScreen.dart';
import '../../networking/constants.dart';

class Settings extends StatefulWidget {
  final String uid;
  const Settings({ Key? key, required this.uid}) : super(key: key);


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String userFullName = '';
  String  userTitle= '';


  String userId = FirebaseAuth.instance.currentUser!.uid;
  void initState() {

    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {

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


          print('name = $fullName');

          // Set the user data in your state or widgets
          setState(() {
            userFullName = fullName;

            userTitle=Title;

          });
        }
      }
  }



  @override
  Widget build(BuildContext context) {
    CollectionReference collRef =
    FirebaseFirestore.instance.collection('Feedback');
    CollectionReference userRef =
    FirebaseFirestore.instance.collection('Users');
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
              EdgeInsets.only(top: height * 0.015, right: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/icons/exit.svg')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.08,
                right: width * 0.08,
                top: height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: height * 0.02,
                  ),
                   Text(
                    userFullName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: kFontStyleBold),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                   Text(
                    userTitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: kFontStyle,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),


                  GestureDetector(
                    onTap:()=> launchUrl(Uri.parse('https://club.syrpronet.com/' )),
                    child: Row(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.07,
                          child: SvgPicture.asset(
                            'assets/icons/syrpro club.svg',
                          ),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Syrpro CLub",
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap:()=> launchUrl(Uri.parse('https://syrpronet.com/' )),
                    child: Row(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.07,
                          child: SvgPicture.asset(
                            'assets/icons/website.svg',
                          ),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Website",
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (context)=>
                          AlertDialog(
                            content:  Container(
                              height: 200,
                              child: Column(
                                children: [
                                  const Text('Please send us message',
                                    style: TextStyle(
                                        fontFamily: kFontStyle,
                                        fontWeight: FontWeight.bold),),
                                  Spacer(),
                                  TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(500),
                                    ],
                                    maxLines: 5,
                                    controller: messageController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      hintText: 'Message us',
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

                                ],
                              ),
                            ),
                            actions:[
                              TextButton( onPressed: () {
                                feedBack(context);
                      },
                                child: const Text('Send',
                                style: TextStyle(
                                  fontFamily: kFontStyle,
                                  color: Colors.black,
                                ),

                                ),
                              ),
                              TextButton( onPressed: () =>Navigator.pop(context),
                                child: const Text('Close',
                                  style: TextStyle(
                                    fontFamily: kFontStyle,
                                    color: Colors.black,
                                  ),),
                              ),
                            ],
                          ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.07,
                          child: SvgPicture.asset(
                            'assets/icons/feedback.svg',
                          ),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Feedback",
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap:()=> launchUrl(Uri.parse('https://syrpronet.com/syrproapp-privacy-policy//' )),
                    child: Row(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.07,
                          child: SvgPicture.asset(
                            'assets/icons/privacyandpolicy.svg',
                          ),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Privacy and policy",
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Change Password',
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: newPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'New Password',

                              ),
                            ),
                            TextFormField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              changePassword(context);
                              passwordController.clear();
                              confirmPasswordController.clear();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const WelcomeScreen()),
                                      (Route<dynamic> route) => false); // Close the dialog
                            },
                            child: const Text('Save',
                              style: TextStyle(
                                fontFamily: kFontStyle,
                                color:Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: const Text('Cancel',
                              style: TextStyle(
                                fontFamily: kFontStyle,
                                color:Colors.black,                              ),),
                          ),
                        ],
                      ),
                    );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          // height: height * 0.07,
                          width: width * 0.07,
                          height: height * 0.03,
                          child: SvgPicture.asset(
                              "assets/icons/change-password.svg"),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Change Password",
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                  ),

                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                              (Route<dynamic> route) => false);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.07,
                          child: SvgPicture.asset(
                            'assets/icons/logout.svg',
                          ),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Logout",
                          style: TextStyle(
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                        showDialog(context: context, builder: (context)=>
                            AlertDialog(
                              content:  Container(
                                height: 50,
                                child: const Column(
                                  children: [
                                    Text('We are sad to see you leave, Are you sure ? ',
                                      style: TextStyle(
                                          fontFamily: kFontStyle,
                                          fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              actions:[
                                TextButton( onPressed: ()  {
                                  deleteAccount();
                                  // Navigate to the welcome screen
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                                        (Route<dynamic> route) => false,
                                  );
                                    // Close the dialog
                                  } ,
                                  child: const Text('Yes'),
                                ),
                                TextButton( onPressed: () =>Navigator.pop(context),
                                  child: const Text('No'),
                                ),
                              ],
                            ),
                        );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            height: height * 0.07,
                            width: width * 0.07,
                            child: Image.asset(
                              'assets/images/delete.png',
                              color: Colors.red,
                            )),
                        SizedBox(
                          width: width * .05,
                        ),
                        const Text(
                          "Delete Your Account",
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
