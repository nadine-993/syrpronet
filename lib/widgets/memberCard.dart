// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Functions.dart';

class memberCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/imageAssets/departments/0.jpg',
                ),
                radius: 30,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                 'Member name',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                'UI/UX Designer',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
