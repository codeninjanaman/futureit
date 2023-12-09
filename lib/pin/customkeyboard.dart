import 'package:flutter/material.dart';

import 'customkeyboardbutton.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) addDigit;
  final VoidCallback removeDigit;

  CustomKeyboard({required this.addDigit, required this.removeDigit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 3; i++)
              CustomKeyboardButton(
                label: i.toString(),
                onPressed: () {
                  addDigit(i.toString());
                },
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomKeyboardButton(
              label: '4',
              onPressed: () {
                addDigit('4');
              },
            ),
            CustomKeyboardButton(
              label: '5',
              onPressed: () {
                addDigit('5');
              },
            ),
            CustomKeyboardButton(
              label: '6',
              onPressed: () {
                addDigit('6');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 7; i <= 9; i++)
              CustomKeyboardButton(
                label: i.toString(),
                onPressed: () {
                  addDigit(i.toString());
                },
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomKeyboardButton(
              label: '0',
              onPressed: () {
                addDigit('0');
              },
            ),
            CustomKeyboardButton(
              label: 'DEL',
              onPressed: () {
                removeDigit();
              },
            ),
            
          ],
        ),
      ],
    );
  }
}

