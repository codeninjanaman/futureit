// import 'package:flutter/material.dart';
// import 'package:futureit/Dashboard/dashboard.dart';
// import 'package:futureit/constants.dart';

// import 'customkeyboard.dart';

// class PinEntryScreen extends StatefulWidget {
//   final String pin;

//   PinEntryScreen(this.pin);

//   @override
//   _PinEntryScreenState createState() => _PinEntryScreenState();
// }

// class _PinEntryScreenState extends State<PinEntryScreen> {
//   String enteredPin = '';

//   void _addDigit(String digit) {
//     if (enteredPin.length < 4) {
//       setState(() {
//         enteredPin += digit;
//       });
//     }
//   }

//   void _removeDigit() {
//     if (enteredPin.isNotEmpty) {
//       setState(() {
//         enteredPin = enteredPin.substring(0, enteredPin.length - 1);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Pallete.color1,
//       // appBar: AppBar(title: Text('Enter PIN')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 150,),
//             Text('Input PIN',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20
//             ),),
//             SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < enteredPin.length; i++)
//                   Container(
//                     width: 50,
//                     height: 50,
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.white
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(enteredPin[i],
//                     style: TextStyle(
//                       color: Colors.white
//                     ),),
//                   ),
//               ],
//             ),

//             SizedBox(height: 150,),
//             CustomKeyboard(addDigit: _addDigit, removeDigit: _removeDigit),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.transparent,
//               ),
//               onPressed: () {
//                 if (enteredPin.length == 4) {
//                   if (enteredPin == widget.pin) {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => Dashboard()),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Incorrect PIN. Please try again.')),
//                     );
//                   }
//                 }
//               },
//               child: Text('Submit',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18
//               ),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
