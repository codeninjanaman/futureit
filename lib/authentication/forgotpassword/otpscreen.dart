import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:futureit/controller/otpcontroller.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../Dashboard/dashboard.dart';
import '../../authentication_repositary/authentication_repositary.dart';
import 'package:get/get.dart';

class otpscreen extends StatelessWidget {
  const otpscreen({super.key});

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepositary.instance.verifyOTP(otp);
    isVerified? Get.offAll(PanCardUploadPage()): Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                
                Color(0xFF110C2C),
                Color(0xFFD69A38),
              ],
              stops: [0.41,0.7]
            )
          ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("CODE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.white,
                  
                ),),
                Text("Verification",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 20,
                ),
                Text("Enter the verification code sent at",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
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
               
                length: 6,
              onCompleted: (code){
                    otp =code;
                   verifyOTP(otp);
                    
                  },

                showCursor: true,
                
              ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      backgroundColor: Colors.black
                    ),
                    onPressed: (){
                      OTPController.instance.verifyOTP(otp);
                      
                    }, child: Text("NEXT",
                    style: TextStyle(
                      color: Colors.white
                    ),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}