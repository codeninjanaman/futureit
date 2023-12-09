import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/onboardingscreen.dart';
import 'package:futureit/pin/confirmmpin.dart';
import 'package:futureit/pin/entrypin.dart';
import 'package:futureit/pin/pinentryscreen.dart';
import 'package:futureit/pin/pinsetupwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final user = FirebaseAuth.instance.currentUser;
  // bool isNewUser = false;
  @override
  void initState() {
    super.initState();
    checkAndNavigate();
  }

  Future<void> checkAndNavigate() async {
     
   // Check if the user is new
    final newuser = await isNewUser();
    
   
    if (newuser) {

      // New user; navigate to PIN setup screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>PinSetupScreen()),
      );
    } else {
      final pin = await getPin();
      if (pin != null && pin.length == 4) {
        // Returning user with a PIN set; navigate to PIN entry screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => 
          PinEntryScreen(pin)
          ),
        );
      } else {
        // Returning user with no PIN set; navigate to PIN setup screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PinSetupScreen()),
        );
      }
    }
  }

  Future<bool> isNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('new_user') ?? true;// Default to true for new users
  }

  

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class PinSetupScreen extends StatefulWidget {
  
  
  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
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
  
  Future<void> setNewUserFlag(bool isNewUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('new_user', isNewUser);
}
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

                  Text('Create mPin',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Pallete.white,
                    fontWeight: FontWeight.w600
                  ),),
                  Text('Create mPin to proceed',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Pallete.white,
                  ),),

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
            // PinSetupWidget(),
          ],
        ),
    
    );
  }
}







class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(
        child: Text('Welcome to the main page!'),
      ),
    );
  }
}



class PinSetupButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  PinSetupButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5),
      height: size.height*0.06,
      width: size.width*0.3,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.white,
        ),
        onPressed: onPressed,
        child: Text(label,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
          color: Pallete.black,
          fontSize: 24,
          fontWeight: FontWeight.w500
        ),
        ) 
        ),
      ),
    );
  }
}

class PinInputField extends StatelessWidget {
  final TextEditingController controller;

  PinInputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      obscureText: true, // Hide the entered PIN digits
      decoration: InputDecoration(labelText: 'Confirm your 4-digit PIN',
      border: OutlineInputBorder(),
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 13
      )),
      maxLength: 4,
    );
  }
}



Future<void> setPin(String pin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('pin', pin);
}

Future<String?> getPin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('pin');
}

