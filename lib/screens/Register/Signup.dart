import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syrpronet/screens/Register/step1.dart';

import '../../networking/constants.dart';
import '../../widgets/textInfoCreateAccount.dart';
import 'codeRegister.dart';

// ... (other imports and code)

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future<void> createUserWithEmailAndPassword() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Registration successful, navigate to the next screen or perform other actions.
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateAccountStep1()));
      } catch (e) {
        // Handle registration errors
        if (e is FirebaseAuthException) {
          if (e.code == 'email-already-in-use') {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Duplicate input'),
                  content: const Text('The provided registration email is already in use.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );

            // The email address is already in use. You can display an error message.
          } else if (e.code == 'weak-password') {
            // The password provided is too weak. You can display an error message.
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Password too week'),
                  content: const Text('The provided password is too week , please insert minimum of 6 characters'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );

          }
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Register your syrpronet account here',
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
                        const TextInfo(text: 'Email Account '),
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
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
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
                        const TextInfo(text: 'Password '),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.visibility_off,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {},
                            ),
                            hintText: 'Password',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
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
                                  backgroundColor: MaterialStateColor.resolveWith(
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
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    kPrimaryColor,
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(15),
                                  ),
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.red,
                                  ),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: createUserWithEmailAndPassword, // Call the registration function
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
