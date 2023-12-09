import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/user_info/income.dart';
import 'package:futureit/user_info/maritalstatus.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class occupation extends StatefulWidget {
  @override
  _occupationState createState() => _occupationState();
}

class _occupationState extends State<occupation> {

  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  int selectedoccupationIndex = -1;
  List<String> occupation= ['Private Sector Service', 'Public Sector Service', 'Government Service','Housewife','Student','Self Employed','Business','Professional','Retired','Farmer','Service','Agriculturist'];
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
                 Text('Occupation',
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
            children: occupation.asMap().entries.map((entry) {
              final index = entry.key;
              final gender = entry.value;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedoccupationIndex = index;
                      String occupationselected = occupation[selectedoccupationIndex];
                      _db.collection("Users").doc(docID).update({"Occupation": "$occupationselected"});
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => income(),
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
                    primary: selectedoccupationIndex == index
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
