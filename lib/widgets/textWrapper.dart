import 'package:flutter/material.dart';

import '../networking/constants.dart';

class TextWrapper extends StatefulWidget {
  const TextWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _TextWrapperState createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
            constraints: isExpanded
                ? const BoxConstraints()
                : BoxConstraints(maxHeight: height * 0.03),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: kFontStyle,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isExpanded
            ? Container(
          color: Colors.transparent,
          width: double.infinity,
          child: SizedBox(
            height: height * 0.05,
            child: GestureDetector(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View less',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle,
                        color: kGrayColor),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: kGrayColor,
                  ),
                ],
              ),
              onTap: () {
                setState(() => isExpanded = false);
              },
            ),
          ),
        )
            : Container(
          width: double.infinity,
          color: Colors.transparent,
          child: SizedBox(
            height: height * 0.05,
            child: GestureDetector(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View More',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle,
                        color: kGrayColor),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: kGrayColor,
                  ),
                ],
              ),
              onTap: () {
                setState(() => isExpanded = true);
              },
            ),
          ),
        ),
      ],
    );
  }
}
