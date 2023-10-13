import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../Functions.dart';
import '../../model/providers/buttonProvider.dart';
import '../../model/providers/informationProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/eventFiltter.dart';
import '../../widgets/projectCard.dart';
import 'createProject/createProject.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ButtonProvider>(context, listen: false).filter = 0.062;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
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
        print(Provider.of<InformationProvider>(context, listen: false)
            .internetAccess);
      },
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: height * 0.12),
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: SvgPicture.asset('assets/icons/plus-small.svg'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => createProject(),
                ),
              );
            }
          ),
        ),
        body: Padding(
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
                  child: Container(
                    height:
                    height * Provider.of<ButtonProvider>(context).filter,
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
                                'Projects',
                                style: TextStyle(
                                  fontFamily: kFontStyle,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (Provider.of<ButtonProvider>(context,
                                      listen: false)
                                      .filter ==
                                      0.062) {
                                    Provider.of<ButtonProvider>(context,
                                        listen: false)
                                        .filter = 0.2;
                                  } else {
                                    Provider.of<ButtonProvider>(context,
                                        listen: false)
                                        .filter = 0.062;
                                  }
                                },
                                icon:
                                SvgPicture.asset('assets/icons/filter.svg'))
                          ],
                        ),
                        Provider.of<ButtonProvider>(context, listen: false)
                            .filter ==
                            0.2
                            ? EventFiltter()
                            : Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  child: ProjectCard(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
/*
Positioned(
top: height * 0.7,
left: width * 0.78,
child: TextButton(
style: TextButton.styleFrom(primary: Colors.transparent),
onPressed: () {
Navigator.of(context).push(
MaterialPageRoute(
builder: (context) => CreateProject(),
),
);
},
child: CircleAvatar(
backgroundColor: kPrimerColor,
radius: 25,
child: SvgPicture.asset('assets/icons/plus-small.svg')),
),
),*/
