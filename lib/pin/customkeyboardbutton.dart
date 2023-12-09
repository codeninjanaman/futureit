import 'package:flutter/material.dart';

class CustomKeyboardButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  CustomKeyboardButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Container(
        width: 120,
        height: 50,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent
          ),
          onPressed: onPressed,
          child: Text(label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),
        ),
      ),
    );
  }
}