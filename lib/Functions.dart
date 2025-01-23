
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syrpronet/screens/Register/Signup.dart';
import 'package:syrpronet/screens/Register/step1.dart';

import 'WelcomeScreen.dart';

final firestoreInstance= FirebaseFirestore.instance;
void retrieveonce ({required element}){
  firestoreInstance.collection("Departments").get().then((value) => {
    value.docs.forEach((result){
    firestoreInstance.collection("Departments")
        .doc(result.id)
        .collection("Members")
        .get()
        .then((subcol){
          subcol.docs.forEach((element){
            print (element.data()['Member name']);
          });
    });

    })
  });
}

String getDateStringFromTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String month = dateTime.month.toString();
  String day = dateTime.day.toString();
  String year = dateTime.year.toString();
  return '$day / $month / $year';
}

String getTimeStringFromTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String hour = dateTime.hour.toString();
  String minute = dateTime.minute.toString();
  return '$hour : $minute';
}
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController RegisterycodeController = TextEditingController();
final newPasswordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final messageController = TextEditingController();
String userId = FirebaseAuth.instance.currentUser!.uid;


Future<void> checkAndLogin(BuildContext context) async {
  String registryCode = RegisterycodeController.text;
  bool isused= false;

  // Assuming you have a Firestore collection 'userCodes'
  final CollectionReference userCodesCollection =
  FirebaseFirestore.instance.collection('userCodes');

  try {
    // Check if the registry code exists in Firestore
    final QuerySnapshot<Object?> registryCodeDocs = await userCodesCollection
        .where('registryCode', isEqualTo: registryCode)
        .where('isused', isEqualTo: false) // Add this condition to check if the code is not used
        .get();

    if (registryCodeDocs.docs.isNotEmpty) {
      // Registration code exists and is not used
      // Get the first document (assuming code is unique) and extract the document ID
      String documentId = registryCodeDocs.docs.first.id;

      // Update the document to mark the code as used
      await userCodesCollection.doc(documentId).update({'isused': true});

      // Proceed to log in or navigate to the next step
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signup()),
      );

    } else {
      // Registration code doesn't exist or is already used
      // Handle the case when the code doesn't exist or is used, e.g., show an error message.
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Registration Code'),
            content: const Text('The provided registration code is not valid or has already been used.'),
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
  } catch (error) {
    // Handle any errors that occurred during the process
    print('Error: $error');
  }
}


Future<void> deleteAccount() async {
   {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current user ID and display name
      String userId = user.uid;
      String userEmail = user.email ?? '';
      // Delete the user from Firebase Authentication
      await user.delete();
      // Get the current user ID
      final CollectionReference deletedAccountsCollection =
      FirebaseFirestore.instance.collection('Deletedaccounts');

      // Create a new document in the "deletedaccounts" collection

      await deletedAccountsCollection.add({
        'userId': userId,
        'useremail':userEmail,
        'deletedAt': FieldValue.serverTimestamp(),
      });

      // Reference to the "users" collection and the specific user document
      final DocumentReference userRef =
      FirebaseFirestore.instance.collection('Users').doc(userId);

      // Delete the user document
      await userRef.delete();

      // Log out the user (although it's not strictly necessary as the account is deleted)
      await FirebaseAuth.instance.signOut();
      // Create a reference to the "deletedaccounts" collection



    }
  }
}


Future<void> changePassword(BuildContext context) async {
  String newPassword = newPasswordController.text;
  String confirmedPassword = confirmPasswordController.text;

  if (newPassword == confirmedPassword) {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updatePassword(newPassword);

        // Password updated successfully
        // Show a success message or navigate to another screen if needed
        print('Password changed successfully!');
      }
    } catch (e) {
      // Handle password update errors
      print('Error updating password: $e');
      // Show an error message or handle the error as needed
    }
  } else {
    // Show an error message indicating passwords don't match
    print('Passwords do not match.');
    // You can also show a dialog or a snackbar to inform the user
  }
}




Future<void> feedBack(BuildContext context) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  if (messageController.text.isNotEmpty) {
    CollectionReference feedbackCollection = FirebaseFirestore.instance.collection('Feedback');
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final DocumentReference userRef = firestore.collection('Users').doc(userId);
    final DocumentSnapshot userSnapshot = await userRef.get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;

      // Fetch user data and set it in your state
      final userFullName = userData['fullname'] as String;
      final title = userData['title'] as String;
      final email = userData['emailadress'] as String;

      print('name = $userFullName');

      // Store the message in the "Feedback" collection
      await feedbackCollection.add({
        'message': messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'fullname': userFullName,
        'title': title,
        'emiladress': email,
        // Include any other data you need to store
      });

      // Clear the message controller
      messageController.clear();

      // Close the dialog
      Navigator.pop(context);
    }
  } else {
    // Handle the case where the message is empty
  }
}









