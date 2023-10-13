import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
