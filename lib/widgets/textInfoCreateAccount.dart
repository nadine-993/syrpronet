import 'package:flutter/material.dart';

import '../networking/constants.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: kFontStyle,
          ),
        ),
        startRequierd,
      ],
    );
  }
}
