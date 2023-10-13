import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../model/providers/listProvider.dart';
import '../networking/constants.dart';

class CustomTextNumber extends StatefulWidget {
  const CustomTextNumber(
      {Key? key,
        required this.countryCodeController,
        required this.phoneNumberController})
      : super(key: key);
  final TextEditingController countryCodeController;
  final TextEditingController phoneNumberController;

  @override
  State<CustomTextNumber> createState() => _CustomTextNumberState();
}

class _CustomTextNumberState extends State<CustomTextNumber> {
  String value = '+963';
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: height * .075,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                items: dialCodes
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    ))
                    .toList(),
                onChanged: (String? value) {
                  if (value == '+212') {
                    setState(() {
                      this.value = '+212 ';
                    });
                    Provider.of<ListProvider>(context, listen: false)
                        .countryCodeValue = '+212 ';
                  } else {
                    setState(() {
                      this.value = value!;
                    });
                    Provider.of<ListProvider>(context, listen: false)
                        .countryCodeValue = value!;
                  }
                },
                isExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * .03,
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: widget.phoneNumberController,
            decoration: const InputDecoration(
              hintText: 'Number',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
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
    );
  }
}
