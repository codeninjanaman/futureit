import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/user_info/occupation%20.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class maritalstatus extends StatefulWidget {
  @override
  _maritalstatusState createState() => _maritalstatusState();
}

class _maritalstatusState extends State<maritalstatus> {
  Color marriedButtonColor = Pallete.white;
  Color singleButtonColor = Pallete.white;
  String selectedmaritalstatus = ''; 
  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  
  // To store the selected gender

  void selectmaritalstatus(String maritalstatus) {
    setState(() {
      selectedmaritalstatus = maritalstatus;
      if (maritalstatus == 'Single') {
        singleButtonColor = Pallete.yellow1; // Change the button color
        marriedButtonColor = Pallete.white;
        _db.collection("Users").doc(docID).update({"Marital Status": "Single"});
      
      } else if (maritalstatus == 'Married') {
        singleButtonColor = Pallete.white;
        marriedButtonColor = Pallete.yellow1; // Change the button color
        _db.collection("Users").doc(docID).update({"Marital Status": "Married"});
      } 

      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>occupation() ,
      ),
    );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  Text('Marital Status',
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
                      SizedBox(height: 15,),
      
                      Row(
                children: [
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Pallete.yellow1,
                          width: 1)
                        ),
                      primary: singleButtonColor,
                      ),
                      onPressed: (){
                        selectmaritalstatus('Single');
                      },
                      child: Text("Single",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 14
                        )
                        )
                      ))),
                  
                  SizedBox(width: 10,),
      
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Pallete.yellow1,
                          width: 1)
                        ),
                      primary: marriedButtonColor,
                      ),
                      onPressed: (){
                        selectmaritalstatus('Married');
                      },
                      child: Text("Married",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 14
                        )
                        )
                      ))),
                  
                  
                ],
              ),
      
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
