import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:pinput/pinput.dart';

import 'mobileotp.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({super.key});

  @override
  State<MyVerify> createState() => _MyVerifyState();
}


class _MyVerifyState extends State<MyVerify> {
  final otpenter = TextEditingController();
  final FirebaseAuth auth=FirebaseAuth.instance;

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

    var code;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset : false,
       body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
               Column(
                children: [
                  SizedBox(height: 100,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15,bottom: 10),
                      child: Text('OTP Verification',
                      style: TextStyle(fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Please enter the otp sent to you',
                      style: TextStyle(fontSize: 16,
                      color: Colors.white,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220,left: 30,right: 30,bottom: 310),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20,),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Pinput(
            controller: otpenter,
                // onChanged: (value){
                //   code=value;
                // },
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 1,top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 40,
            
              child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async{
                      showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
                      try{
PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Mobileotp.verifies, smsCode: otpenter.text);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dashboard()));
                      }
                      catch(e){
                        print('Wrong OTP');

                      }
                     
                    },
                    child: const Text("Verify Phone Number",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                    ),)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Mobileotp()));
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.grey.shade800,
                        fontSize: 10),
                      )),
                
              ],
            ),
          ),

        ]),
      ),
    ),
          )
          
        ],),
    );
  }

}