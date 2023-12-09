import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/user_info/maritalstatus.dart';
import 'package:google_fonts/google_fonts.dart';

class gender extends StatefulWidget {
  @override
  _genderState createState() => _genderState();
}

class _genderState extends State<gender> {
  Color maleButtonColor = Pallete.white;
  Color femaleButtonColor = Pallete.white;
  Color otherButtonColor = Pallete.white;
  String selectedGender = ''; 
  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  
  // To store the selected gender

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
      if (gender == 'Male') {
        maleButtonColor = Pallete.yellow1; // Change the button color
        femaleButtonColor = Pallete.white;
        otherButtonColor = Pallete.white;
        _db.collection("Users").doc(docID).update({"Gender": "Male"});
      } else if (gender == 'Female') {
        maleButtonColor = Pallete.white;
        femaleButtonColor = Pallete.yellow1; // Change the button color
        otherButtonColor = Pallete.white;
        _db.collection("Users").doc(docID).update({"Gender": "Female"});
        // _db.collection("Users").se
      } else if (gender == 'Other') {
        maleButtonColor = Pallete.white;
        femaleButtonColor = Pallete.white;
        otherButtonColor = Pallete.yellow1; 
        _db.collection("Users").doc(docID).update({"Gender": "Other"});// Change the button color
      }

      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => maritalstatus(),
      ),
    );
    });
  }

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.05,),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                    child: Image(image: AssetImage('assets/images/gender.png'),
                    height: size.height*0.18,
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),

                  Text('Gender',
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
                      ],
                    ),
                  ),
                  
      
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        child: Row(
                                      children: [
                                        Expanded(child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Pallete.yellow1,width: 1)
                          ),
                          
                           
                        primary: maleButtonColor,
                        ),
                        onPressed: (){
                          selectGender('Male');
                        },
                        child: Text("Male",
                        
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
                            side: BorderSide(color: Pallete.yellow1,width: 1)
                          ),
                        primary: femaleButtonColor,
                        ),
                        onPressed: (){
                          selectGender('Female');
                        },
                        child: Text("Female",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 14
                        )
                        )
                        ))),
                                        
                                        
                                      ],
                                    ),
                      ),
      
              // SizedBox(height: 15,),
      
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Pallete.yellow1,width: 1)
                          ),
                        primary: otherButtonColor,
                        ),
                        onPressed: (){
                          selectGender('Other');
                        },
                        child: Text("Other",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 14
                        )
                        )))),
                    
                    SizedBox(width: size.width*0.46),           
                  ],
                ),
              ),
                ],
              ),
            
          ),
        ),
      ),
    );
  }
}