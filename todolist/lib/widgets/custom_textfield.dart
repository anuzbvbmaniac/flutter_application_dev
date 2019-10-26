import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String labeltext;
  final TextEditingController controller;

  CustomTextField({@required this.labeltext, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: labeltext,
      ),
    );
  }
}
