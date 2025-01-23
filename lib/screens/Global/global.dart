
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/widgets/globalCard.dart';

import '../../model/providers/buttonProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/departmentCard.dart';
import '../../widgets/teamCard.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ButtonProvider>(context);
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.03,
            top: height * 0.03,
            bottom: height * 0.02,
          ),
          child: const Row(


            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 0.025,
                    left:  0.03),
                child: Text(
                  'Global',
                  style: TextStyle(
                    fontFamily: kFontStyle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),
        ),
        Expanded(
          child: provider.isDepartments ? GlobalCard() : const TeamsCard(),
        ),
      ],
    );
  }
}
