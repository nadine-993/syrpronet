import 'package:flutter/material.dart';

import '../../networking/constants.dart';



class LogIn extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Padding(
        padding: EdgeInsets.only(left: height * 0.01),
    child: Image.asset('assets/imageAssets/logo.png'),
    ),
        ),
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width:200,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  // Perform login action here using _emailController.text and _passwordController.text
                  _login();
                },
                child: const Text('Login',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontStyle,
                    fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Here you can add the logic to validate the email and password
    // and perform the authentication process, e.g., using Firebase Auth.

    // For simplicity, we'll just show a snackbar indicating successful login.
    if (email.isNotEmpty && password.isNotEmpty) {
      _showSnackBar('Login successful!');
    } else {
      _showSnackBar('Please enter both email and password.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
