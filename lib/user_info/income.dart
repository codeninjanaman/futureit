import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
import 'package:futureit/pin/pin.dart';
import 'package:futureit/user_info/maritalstatus.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class income extends StatefulWidget {
  @override
  _incomeState createState() => _incomeState();
}

class _incomeState extends State<income> {

  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  int selectedincomeIndex = -1;
  List<String> income= ['Upto 1 Lakh', '1 Lakh - 5 Lakh', '5 Lakh - 10 Lakh','10 Lakh - 25 Lakh','25 Lakh - 50 Lakh','50 Lakh - 1 Crore','1 Crore - 5 Crore','More than 5 Crores'];
  // To store the selected gender

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Scaffold(
          
          backgroundColor: Pallete.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,
            color: Pallete.black,)),
          ),
          
      
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Income',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Pallete.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    )
                  ),),
                  Text('Select one of the options',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Pallete.black,
                      fontSize: 14
                    )
                  ),),
                      SizedBox(height: size.height*0.04,),
      
                      Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: income.asMap().entries.map((entry) {
              final index = entry.key;
              final gender = entry.value;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedincomeIndex = index;
                      String incomeselected = income[selectedincomeIndex];
                      _db.collection("Users").doc(docID).update({"Income": "$incomeselected"});
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PinSetupScreen(),
                      ),
                    );
                  },
                  child: Text(gender,
                  style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 14
                        )
                        )
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: Pallete.yellow1,
                        width: 1
                      )
                    ),
                    primary: selectedincomeIndex == index
                        ? Pallete.yellow1
                        : Pallete.white,
                  ),
                ),
              );
            }).toList(),
                      )
      
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
