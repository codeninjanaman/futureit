import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/controller/otpcontroller.dart';
import 'package:futureit/signup.dart/verificationscreen.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:futureit/user_info/pancardtextfield.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../authentication_repositary/authentication_repositary.dart';
import 'package:get/get.dart';

class otpscreen extends StatelessWidget {
  const otpscreen({super.key});

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepositary.instance.verifyOTP(otp);
    isVerified? Get.to(pancardentry()): Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference users =  FirebaseFirestore.instance.collection('Users');
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
    var otp;
    var otpController = Get.put(OTPController());
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Pallete.greyBackgroundCOlor, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Colors.white,
        title: Text('OTP Screen',
        style: TextStyle(
          fontSize: 16,
          color: Pallete.black1
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,
        size: 18,
        color: Pallete.black1,))
      ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.1,),
                  Container(
                    padding: EdgeInsets.all(40),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3BA2F).withOpacity(0.4),
                      // borderRadius: BorderRadius.circular(100)
                    ),
                    child: Image(image: AssetImage('assets/images/phoneotp.png',),
                    fit: BoxFit.contain,
                   ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Text("Enter the verification code sent at",
                  style: TextStyle(color: Pallete.black1),
                  textAlign: TextAlign.center,
                  ),
                  FutureBuilder <DocumentSnapshot>(
                future: users.doc(Pallete.documentId).get(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String , dynamic>;
            return Text(data['Phone'], 
            style: TextStyle(fontSize: 14,
            color: Pallete.black1),);
                  }
                  return const Text('');
                },
              ),
                  SizedBox(height: 20,),
                  // OtpTextField(
                  //   numberOfFields: 6,
                  //   fillColor: Colors.black.withOpacity(0.1),
                  //   filled: true,
                  //   onSubmit: (code){
                  //     otp =code;
                  //     AuthenticationRepositary.instance.verifyOTP(otp);
                      
                  //   },
                  // ),
                   Pinput(
                 defaultPinTheme: defaultPinTheme,
                  length: 6,
                onCompleted: (code){
                      otp =code;
                     verifyOTP(otp);
                      
                    },
          
                  showCursor: true,
                  
                ),
                  SizedBox(height: size.height*0.08,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        backgroundColor: Pallete.yellow1
                      ),
                      onPressed: (){
                        OTPController.instance.verifyOTP(otp);
                        
                      }, child: Text("Verify",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),)),
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