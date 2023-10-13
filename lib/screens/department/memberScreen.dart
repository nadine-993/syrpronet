import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/networking/constants.dart';

import '../../../widgets/memberCard.dart';
import '../../Functions.dart';
import '../../model/providers/informationProvider.dart';
import '../../widgets/CustomAppBarCreateAccount.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    retrieveonce;
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
          Provider.of<InformationProvider>(context, listen: false)
              .internetAccess();
          if (!Provider.of<InformationProvider>(context, listen: false)
              .internetAccessB!) {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                    content: const Text(
                      'Please check your internet access',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kFontStyle),
                    ),
                    actions: <Widget>[
                      Center(
                        child: SizedBox(
                          width: width * 0.6,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok')),
                        ),
                      )
                    ]));
          }
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(
              top: height * 0.015,
              left: width * 0.02,
              right: width * 0.02,
            ),
            children: [
              CustomAppBar(title: title),
              AnimationLimiter(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (
                      context,
                      int? index,
                      ) =>
                      AnimationConfiguration.staggeredGrid(
                        position: index!,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        columnCount: 4,
                        child:   ScaleAnimation(
                          duration: const Duration(
                            milliseconds: 900,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: memberCard(),
                          )
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
