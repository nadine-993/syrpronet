import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm(
      {Key? key,
        required this.hintText,
        required this.textInputType,
        required this.controller})
      : super(key: key);
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}
