import 'package:flutter/material.dart';

const height = 42.0;
const minWidth = 200.0;
const borderRadius = 30.0;

class CustomRaisedButton extends StatelessWidget {
  final Color color;
  final Function onPress;
  final String text;

  CustomRaisedButton(
      {required this.color, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: () => onPress(),
          minWidth: minWidth,
          height: height,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
