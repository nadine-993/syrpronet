import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/model/providers/buttonProvider.dart';
import 'package:syrpronet/screens/Register/step1.dart';
import '../../Functions.dart';
import '../../home.dart';
import '../../model/providers/listProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/textInfoCreateAccount.dart';
import '../navigation.dart';

class codeRegister extends StatefulWidget {
  codeRegister({Key? key}) : super(key: key);

  @override
  State<codeRegister> createState() => _codeRegisterState();
}

class _codeRegisterState extends State<codeRegister> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  'Please enter your registery code here',
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

                        const TextInfo(text: 'Registery code '),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          controller: RegisterycodeController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Registery code',
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
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(5),
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
                                  padding:
                                  MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.all(15)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  //  FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                                  // .then((value){
                                  checkAndLogin(context);
                                  RegisterycodeController.clear();

                                  // }).onError((error, stackTrace) {
                                  //  print("Error ${error.toString()}");
                                  // });
                                },
                                child: const Text(
                                  'Check code >',
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

