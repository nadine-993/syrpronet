import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../model/providers/buttonProvider.dart';
import '../../model/providers/informationProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/eventCard.dart';
import '../../widgets/eventFiltter.dart';
import '../../widgets/loading.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isLoading = false;
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      displacement: 50,
      color: kPrimaryColor,
      onRefresh: () async {
        setState(() {
          isLoading = true;
        });

        Provider.of<InformationProvider>(context, listen: false)
            .internetAccess();
        setState(() {
          isLoading = false;
        });
        if (!Provider.of<InformationProvider>(context, listen: false)
            .internetAccessB!) {
          setState(() {
            isLoading = true;
          });

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
      child: isLoading
          ? Loading()
          : Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
        ),
        child: LayoutBuilder(builder: (context, constrains) {
          double localHeight = constrains.maxHeight;
          double localWidth = constrains.maxWidth;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: height *
                      Provider.of<ButtonProvider>(context).filter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: localHeight * 0.025,
                                left: localWidth * 0.03),
                            child: const Text(
                              'Events',
                              style: TextStyle(
                                fontFamily: kFontStyle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Expanded(
                child: EventCard(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
