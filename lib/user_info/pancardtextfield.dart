import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class pancardentry extends StatefulWidget {
  const pancardentry({super.key});

  @override
  State<pancardentry> createState() => _pancardentryState();
}

class _pancardentryState extends State<pancardentry> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController pancardcontroller = TextEditingController();
  final _db = FirebaseFirestore.instance;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _isValid = false;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){
                      // Get.offAll(Dashboard());
                    },
                    child: Text('Skip',
                    style: TextStyle(
                      color: Pallete.black1,
                      fontSize: 14,
                      decoration: TextDecoration.underline, 
                                                 decorationColor: Pallete.black1
                    ),),
                  ),
                ),

                SizedBox(
                  height: size.height*0.07,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/images/yellowtick.png'),
                  height: size.height*0.3,
                  width: size.width*0.3,
                              ),
                ),


                Text('Verify PAN Card',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Pallete.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  )
                ),),
                SizedBox(height: size.height*0.01,),
                Text('A PAN Card is compulsory for investing in india. This is one-time setup & takes less than a minute.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Pallete.black,
                    fontSize: 12,
                    
                  )
                ),),
                SizedBox(height: size.height*0.05,),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                      controller: pancardcontroller,
                      
                 validator: (value) {
            if (value == null || value.isEmpty) {
              _isValid = false;
              return 'Please enter PAN Card Number';
              
            }
            // Validate PAN Card format using a regular expression
            // Format: Five uppercase letters followed by four numbers and one uppercase letter
            if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value)) {
              _isValid = false;
              return 'Enter a valid PAN Card Number';

            }
            if (value.length != 10) {
              _isValid = false;
              return 'PAN Card Number should be 10 characters long';
            }
            _isValid = true;
            return null;
          },
                      style: TextStyle(color: Colors.black,
                
                      fontSize: 14),
                      
                      decoration: InputDecoration(
                        
                        contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                      
                        hintText: 'ABCDE1234A',
                        // prefixIcon: Icon(Icons.lock,
                        // size: 20,),
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        labelStyle: TextStyle(color: Pallete.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 1.0,
                          color: Pallete.black)
                        )
                        
                      )
                ),
                SizedBox(height: size.height*0.03,),
                SizedBox(
                  width: size.width*0.7,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.yellow1,
                      elevation: 4
                    ),
                    onPressed: (){
                    if (_formKey.currentState!.validate()){
                      Get.to(PanCardUploadPage());
                      _db.collection("Users").doc(Pallete.documentId).update({"PAN Card": pancardcontroller.text.trim()});
            //           Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) =>  PanCardUploadPage()),
            // );
                    }
                  }, child: Text('Verify',
                  style: TextStyle(
                    color: Pallete.black
                  ),)),
                )
                    ],
                  ),
                
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}