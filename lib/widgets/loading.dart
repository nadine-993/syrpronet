

import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';


class Loading extends StatefulWidget {
  @override
  _Loading createState() => _Loading();
}

class _Loading extends State<Loading> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Fade(
        duration: Duration(seconds: 1),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/logo.png'),
          radius: 100,
        ),
      ),
    );
  }
}
