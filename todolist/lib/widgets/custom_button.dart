import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final Color borderColor;

  CustomButton({
    @required this.onPressed,
    @required this.buttonText,
    this.color,
    this.textColor,
    this.borderColor = Colors.transparent
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: borderColor),
        ),
        color: color,
        textColor: textColor,
        padding: const EdgeInsets.all(14.0),
        child: Text(buttonText),
      ),
    );
  }
}
