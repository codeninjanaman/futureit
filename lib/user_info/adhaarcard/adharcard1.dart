import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/user_info/adhaarcard/adhaarcardformatter.dart';
import 'package:futureit/user_info/adhaarcard/adhaarcardupload.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class adhaarcardscreenone extends StatefulWidget {
  const adhaarcardscreenone({super.key});

  @override
  State<adhaarcardscreenone> createState() => _adhaarcardscreenoneState();
}

class _adhaarcardscreenoneState extends State<adhaarcardscreenone> {
  final _formKey = GlobalKey<FormState>();
  final _db = FirebaseFirestore.instance;
  final TextEditingController adhaarcardcontroller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
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
                  child: Text('Skip',
                  style: TextStyle(
                    color: Pallete.black1,
                    fontSize: 14,
                    decoration: TextDecoration.underline, 
                                               decorationColor: Pallete.black1
                  ),),
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


                Text('Verify Adhaar Card',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Pallete.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  )
                ),),
                SizedBox(height: size.height*0.01,),
                Text('An Adhaar Card is compulsory for investing in India',
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
                        // maxLength: 14,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            AadhaarCardFormatter(), // Custom formatter to add spaces after every 4 digits
          ],
                      controller: adhaarcardcontroller,
                      
                 validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Aadhaar Card Number';
            }
            if (value.length != 15) {
              return 'Aadhaar Card Number should be 12 digits';
            }
            return null;
          },
                      style: TextStyle(color: Colors.black,
                
                      fontSize: 14),
                      
                      decoration: InputDecoration(
                        
                        contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                      
                        hintText: '0000 0000 0000',
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
                      Get.to(AadhaarUploadScreen());
                      _db.collection("Users").doc(Pallete.documentId).update({"Adhaar Card": adhaarcardcontroller.text});
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