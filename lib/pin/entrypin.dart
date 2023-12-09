import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/pin/pin.dart';
import 'package:futureit/profile/getdetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PinEntryScreen extends StatefulWidget {
  final String pin;

  PinEntryScreen(this.pin);
  
  @override
  State<PinEntryScreen> createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {

  String enteredPin = '';

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
  final TextEditingController _pinController = TextEditingController();
  late final Future<QuerySnapshot<Map<String, dynamic>>>? _userDataFuture;
  
//   Future<void> setNewUserFlag(bool isNewUser) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('new_user', isNewUser);
// }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 61,
      textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          ),
      decoration: BoxDecoration(
        boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 4, // Blur radius
        offset: Offset(2, 2), // Offset in the y direction
      ),
    ],
        color: Pallete.white,
        // border: Border.all(color: Pallete.yellow1),
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.white,
      // appBar: AppBar(title: Text('PIN Setup')),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              
              decoration: BoxDecoration(
                color: Pallete.yellow1,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(30) )
              ),
              height: size.height*0.5,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: size.height*0.12,),
                  Image.asset('assets/images/finnit.png',
                  height: size.height*0.04,),

                  SizedBox(height: size.height*0.08,),
                  // Row(
                  //   children: [
                  //     Text('Hi, ',
                  //     style: GoogleFonts.inter(
                  //       textStyle: TextStyle(
                  //         color: Pallete.black,
                  //         fontSize: 16
                  //       )
                  //     ),),
                  //     getdetails(userDataFuture: _userDataFuture, detailname: 'FullName')
                  //   ],
                  // ),


                  Text('Input PIN',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    color: Pallete.white,
                    fontWeight: FontWeight.w600
                  ),),
                  // Text('Confirm mPin to proceed',
                  // style: GoogleFonts.inter(
                  //   fontSize: 12,
                  //   color: Pallete.white,
                  // ),),

                  SizedBox(height: size.height*0.08,),
                  Pinput(
            controller: _pinController,
            keyboardType: TextInputType.number,
                 defaultPinTheme: defaultPinTheme,
                  length: 4,
                onCompleted: (code){
                    },
          
                  showCursor: true,
                  
                ),



                ],
              ),
            ),
            
           
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
                  if (_pinController.text == widget.pin) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Incorrect PIN. Please try again.')),
                    );
                  }
                }
              },
            ),
            
          ],
        ),
          ],
        ),
            // PinSetupWidget(),
          ],
        ),
    
    );
  }
}