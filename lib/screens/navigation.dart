import 'package:flutter/material.dart';
import 'package:syrpronet/screens/home/home.dart';
import 'package:syrpronet/screens/profile/profile.dart';
import 'package:syrpronet/screens/project/project.dart';
import 'package:syrpronet/screens/settings/settings.dart';
import 'package:flutter_svg/svg.dart';

import '../networking/constants.dart';
import 'department/department.dart';
import 'event/event.dart';

class navigation extends StatefulWidget {
  const navigation({Key? key}) : super(key: key);

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Future getHomePage() async {
    double height = MediaQuery
        .of(context)
        .size
        .height;
  }
    @override
    void dispose() {
      super.dispose();
      tabController!.dispose();
    }

    @override
    Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: Padding(
            padding: EdgeInsets.only(left: height * 0.01),
            child: Image.asset('assets/imageAssets/logo.png'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
              icon: SvgPicture.asset('assets/icons/apps.svg'),
            )
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: const <Widget>[
            HomeScreen(),
            EventScreen(),
            ProjectScreen(),
            DepartmentScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(
                width * 0.03, 0, width * 0.03, height * 0.02),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: LayoutBuilder(builder: (context, constrains) {
                  double localHeight = constrains.maxHeight;
                  return Container(
                    height: localHeight * 0.08,
                    color: Colors.white,
                    child: TabBar(
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 0,
                          ),
                        ),
                      ),
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle,
                        fontSize: 10,
                      ),
                      tabs: <Widget>[
                        Tab(
                          icon: SvgPicture.asset('assets/icons/homeOn.svg'),
                          text: 'Home',
                        ),
                        Tab(
                          icon: SvgPicture.asset('assets/icons/eventOn.svg'),
                          text: 'Events',
                        ),
                        Tab(
                          icon: SvgPicture.asset('assets/icons/projectOn.svg'),
                          text: 'Project',
                        ),
                        Tab(
                          icon:
                              SvgPicture.asset('assets/icons/departmentOn.svg'),
                          text: 'Departments',
                        ),
                        Tab(
                          icon: SvgPicture.asset('assets/icons/user.svg'),
                          text: 'Profile',
                        ),
                      ],
                      controller: tabController,
                    ),
                  );
                }))));
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
