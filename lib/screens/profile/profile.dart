import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/providers/informationProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/textWrapper.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;


  ProfileScreen({required this.uid, Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userFullName = '';
  late String userEmailadress = '';
  String  userTitle= '';
  String userRole = '';
  String userSector = '';
  String userNumber = '';
  String userBio = '';
  String userLinkedin = '';


  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();

    // Fetch the user data when the screen is initialized
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
          final emailAdress = userData['emailadress'] as String;
          final Title = userData['title'] as String;
          final Role = userData['role'] as String;
          final Sector = userData['sector'] as String;
          final Bio = userData['bio'] as String;
          final Linkein = userData['linkedin'] as String;

          print('name = $fullName');

          // Set the user data in your state or widgets
          setState(() {
            userFullName = fullName;
             userEmailadress=emailAdress;
            userTitle=Title;
            userRole=Role;
            userSector=Sector;
            userBio=Bio;
            userLinkedin=Linkein;
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
  Widget build(BuildContext context) {
  double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      color: kPrimaryColor,
      onRefresh: () async {
        Provider.of<InformationProvider>(context, listen: false)
            .internetAccess();
        if (!Provider.of<InformationProvider>(context, listen: false)
            .internetAccessB!) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  content: const Text(
                    'Please check your internet access',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle),
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
                            child: const Text('Ok')),
                      ),
                    )
                  ]));
        }
        print(Provider.of<InformationProvider>(context, listen: false)
            .internetAccess);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [

              Stack(
                children: [
                  Center(
                    child: Container(
                      height: height * 0.28,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Text( userFullName,
                              style: const TextStyle(
                                fontFamily: kFontStyleBold,
                                fontSize: 20,
                              )),
                          SizedBox(
                            height: height * 0.03,
                          ),
                           Text(
                            userTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              color: kGrayColor,
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.016,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Role",
                                      style:  TextStyle(
                                        fontSize: 16,
                                        color: kGrayColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kFontStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                     Text(
                                      userRole,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: kFontStyleBold,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: kGrayColor,
                                  thickness: 1,
                                  width: width * 0.17,
                                  indent: height * 0.0000000000001,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Sector",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kGrayColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kFontStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                     Text(
                                      userSector,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: kFontStyleBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.035,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: width * .2,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: Colors.white),
                        child: Center(
                          child: SvgPicture.asset('assets/icons/gmail.svg'),
                        ),
                      ),
                      onTap: ()  {
                        {
                          showDialog(context: context, builder: (context)=>
                              AlertDialog(
                                content:  Text('$userEmailadress'),
                                actions:[
                                  TextButton(onPressed: ()=> Navigator.pop(context),
                                    child: const Text('Ok'),),
                                ],
                              ),
                          );
                        };



                    },

                    ),
                    GestureDetector(
                      child: Container(
                        width: width * .2,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12),
                            ),
                            color: Colors.white),
                        child: Center(
                          child: SvgPicture.asset('assets/icons/linkedIn.svg'),
                        ),
                      ),
                      onTap: ()  {
                        showDialog(context: context, builder: (context)=>
                        AlertDialog(
                          content:  Text('$userLinkedin'),
                          actions:[
                            TextButton(onPressed: ()=> Navigator.pop(context),
                        child: const Text('Ok'),),
                          ],
                        ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Text(
                'Bio',
                style: TextStyle(
                    fontFamily: kFontStyle,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: height * 0.02,
              ),
               TextWrapper(
                text:userBio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

