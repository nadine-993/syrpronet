
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/model/providers/buttonProvider.dart';
import 'package:syrpronet/screens/Register/step2.dart';
import '../../home.dart';
import '../../model/providers/listProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/textInfoCreateAccount.dart';
import '../navigation.dart';




class CreateAccountStep2 extends StatefulWidget {
  CreateAccountStep2({Key? key}) : super(key: key);

  @override
  State<CreateAccountStep2> createState() => _CreateAccountStep2State();

}

class _CreateAccountStep2State extends State<CreateAccountStep2> {

  var roleList = [];
  var sectorList = [];
  @override

  void initState() {

    super.initState();
  }
  TextEditingController bioController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  String? softSkillsValue, daysValue, hoursValue;

  String? roleValue, sectorValue;

  String value = '+963';

  bool isHidden1 = true;

  bool isHidden2 = true;

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: 'MontserratBold',
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              LinearProgressIndicator(
                value: Provider.of<ButtonProvider>(context, listen: false)
                    .progress,
                valueColor: const AlwaysStoppedAnimation(kPrimaryColor),
                backgroundColor: Colors.grey.shade300,
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                Provider.of<ButtonProvider>(context).numberOfStep,
                style: const TextStyle(color: kSecondaryColor),
              ),
              SizedBox(
                height: height * .02,
              ),
              const Text(
                'General information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: kFontStyleBold,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Bio '),
                        SizedBox(
                          height: height * .02,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(100),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          maxLines: 5,
                          controller: bioController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Bio',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'LinkedIn Account'),
                        SizedBox(
                          height: height * .02,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: linkedinController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'URL',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const Text(
                          'Availability Time',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: kFontStyle,
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: height * .07,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Container(
                                        padding:
                                        EdgeInsets.only(left: width * 0.04),
                                        width: width * .28, //and here
                                        child: const Text(
                                          "Days Per Week",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    items: daysPerWeek
                                        .map<DropdownMenuItem<String>>(
                                            (String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.05),
                                                child: Text(item),
                                              ),
                                            ))
                                        .toList(),
                                    value: daysValue,
                                    onChanged: (value) {
                                      daysValue = value;
                                    },
                                    isExpanded: true,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .05,
                            ),
                            Expanded(
                              child: Container(
                                height: height * .07,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Container(
                                        padding:
                                        EdgeInsets.only(left: width * 0.04),
                                        width: width * .28, //and here
                                        child: const Text(
                                          "Hour Per Day",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    items: hourPerDay
                                        .map<DropdownMenuItem<String>>(
                                            (String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.05),
                                                child: Text(item),
                                              ),
                                            ))
                                        .toList(),
                                    value: hoursValue,
                                    onChanged: (value) {
                                      hoursValue = value;
                                    },
                                    isExpanded: true,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .03,
                        ),



                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width * .4,
                              height: height * .06,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateColor.resolveWith(
                                          (states) => Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  '< Back',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kFontStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .4,
                              height: height * .06,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      kPrimaryColor),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsets>(
                                      const EdgeInsets.all(15)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Provider.of<ButtonProvider>(context,
                                      listen: false)
                                      .numberOfStep = 'Step 2 of 2';
                                  Provider.of<ButtonProvider>(context,
                                      listen: false)
                                      .progress = 0.35;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              navigation()));                                },
                                child: const Text(
                                  'Create >',
                                  style: TextStyle(
                                    fontFamily: kFontStyle,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
