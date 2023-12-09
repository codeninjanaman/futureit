import 'package:flutter/services.dart';

class AadhaarCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      final String text = newValue.text.replaceAll(' ','');
      String newText = '';

      for (var i = 0; i < text.length; i += 4) {
        if (i + 4 <= text.length) {
          newText += text.substring(i, i + 4) + ' ';
        } else {
          newText += text.substring(i);
        }
      }

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue;
  }
}






