import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/providers/buttonProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/departmentCard.dart';
import '../../widgets/teamCard.dart';
class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
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
    top: height *0.03,
  bottom: height * 0.02,
),
          child: Row(
children:[
GestureDetector(
  child: Text(
    "Departments",
    style: provider.departmentsButton,
  ),
  onTap: (){
    Provider.of<ButtonProvider>(context, listen: false)
        .teamsButton = const TextStyle(color: Colors.grey);
    Provider.of<ButtonProvider>(context, listen: false)
        .departmentsButton =
    const TextStyle(color: kSecondaryColor);
    Provider.of<ButtonProvider>(context, listen: false)
        .isDepartments = true;
    },
),
  SizedBox(
    width:width *0.1
  ),
  GestureDetector(
    onTap: () {
      Provider.of<ButtonProvider>(context, listen: false)
          .departmentsButton = const TextStyle(color: Colors.grey);
      Provider.of<ButtonProvider>(context, listen: false)
          .teamsButton = const TextStyle(color: kSecondaryColor);
      Provider.of<ButtonProvider>(context, listen: false)
          .isDepartments = false;
    },
    child: Text(
      'Teams',
      style: provider.teamsButton,
    ),
  ),
],
          ),
        ),
        Expanded(
          child: provider.isDepartments ? DepartmentCard() : const TeamsCard(),
        ),
],
          );
  }
}
