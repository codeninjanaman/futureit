import 'package:flutter/material.dart';
import 'package:futureit/pin/confirmmpin.dart';
import 'package:futureit/pin/pin.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
class PinSetupWidget extends StatefulWidget {
  @override
  _PinSetupWidgetState createState() => _PinSetupWidgetState();
}

class _PinSetupWidgetState extends State<PinSetupWidget> {
  final TextEditingController _pinController = TextEditingController();

  Future<void> setNewUserFlag(bool isNewUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('new_user', isNewUser);
}


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          ),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.yellow1),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Container(
          padding: EdgeInsets.all(20),
          child: Pinput(
            controller: _pinController,
            keyboardType: TextInputType.number,
                 defaultPinTheme: defaultPinTheme,
                  length: 4,
                onCompleted: (code){
                    },
          
                  showCursor: true,
                  
                ),
          // PinInputField(controller: _pinController)
          ),

          // SizedBox(height: 100,),

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 3; i++)
                  PinSetupButton(
                    label: i.toString(),
                    onPressed: () {
                      _addDigit(i.toString());
                    },
                  ),
              ],
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinSetupButton(
              label: '4',
              onPressed: () {
                _addDigit('4');
              },
            ),
            PinSetupButton(
              label: '5',
              onPressed: () {
                _addDigit('5');
              },
            ),
            PinSetupButton(
              label: '6',
              onPressed: () {
                _addDigit('6');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 7; i <= 9; i++)
              PinSetupButton(
                label: i.toString(),
                onPressed: () {
                  _addDigit(i.toString());
                },
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinSetupButton(
              label: 'DEL',
              onPressed: () {
                _removeDigit();
              },
            ),
            PinSetupButton(
              label: '0',
              onPressed: () {
                _addDigit('0');
              },
            ),
            PinSetupButton(
              label: '->',
              onPressed: () {
                if (_pinController.text.length == 4) {
              // Store the entered PIN
              setPin(_pinController.text);

              setNewUserFlag(false);
              // Navigate to PIN confirmation screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PinConfirmScreen(_pinController.text)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please enter a 4-digit PIN.')),
              );
            }
              },
            ),
            
          ],
        ),
          ],
        ),
      ],
    );
  }

  void _addDigit(String digit) {
    if (_pinController.text.length < 4) {
      setState(() {
        _pinController.text = _pinController.text + digit;
      });
    }
  }

  void _removeDigit() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _pinController.text = _pinController.text.substring(0, _pinController.text.length - 1);
      });
    }
  }
}