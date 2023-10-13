
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/model/providers/buttonProvider.dart';
import 'package:syrpronet/screens/Register/step2.dart';
import '../../model/providers/listProvider.dart';
import '../../networking/constants.dart';
import '../../widgets/textInfoCreateAccount.dart';




class CreateAccountStep1 extends StatefulWidget {
  CreateAccountStep1({Key? key}) : super(key: key);



  @override
  State<CreateAccountStep1> createState() => _CreateAccountStep1State();

}

class _CreateAccountStep1State extends State<CreateAccountStep1> {

  var roleList = [];
  var sectorList = [];
  @override

  void initState() {

    super.initState();
  }

  final fullNameController = TextEditingController();

  final countryCodeController = TextEditingController();

  final phoneNumberController = TextEditingController();


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
                'Tell us more about you',
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
                        const TextInfo(text: 'Full Name '),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          controller: fullNameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Full Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 0.5),
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

                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Role '),
                        SizedBox(
                          height: height * .01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey, width: 0.5),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5))),

                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const TextInfo(text: 'Sector '),
                        SizedBox(
                          height: height * .01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey, width: 0.5),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5))),

                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        const Text('Number',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: kFontStyle,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: height * .07,
                              width: width * 0.2,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: Provider.of<ListProvider>(
                                      context,
                                      listen: false)
                                      .countryCodeValue,
                                  icon: const Visibility(
                                      visible: false,
                                      child: Icon(Icons.arrow_downward)),
                                  items: dialCodes
                                      .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Center(
                                                child: Text(value)),
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    if (value == '+212') {
                                      this.value = '+212 ';

                                      Provider.of<ListProvider>(context,
                                          listen: true)
                                          .countryCodeValue = '+212 ';
                                    } else {
                                      this.value = value!;

                                      Provider.of<ListProvider>(context,
                                          listen: false)
                                          .countryCodeValue = value;
                                    }
                                  },
                                  isExpanded: true,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .03,
                            ),
                            SizedBox(
                              height: height * 0.07,
                              width: width * 0.7,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneNumberController,
                                decoration: const InputDecoration(
                                  hintText: 'Number',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
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
                                  CollectionReference collRef= FirebaseFirestore.instance.collection('signup-step one');
                                  collRef.add({
                                    'fullname':fullNameController.text,
                                    'phonenumber': phoneNumberController.text,
                                    'countrycode': countryCodeController.text,
                                  }
                                  );
                                 //Navigator.of(context).push(
                                  ////    MaterialPageRoute(
                                   //  builder: (context) =>CreateAccountStep2()));
                                 },
                                child: const Text(
                                  'Next >',
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
