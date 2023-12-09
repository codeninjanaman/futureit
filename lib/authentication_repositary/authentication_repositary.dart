// import 'dart:ffi';
// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/Getstarted.dart';
import 'package:futureit/authentication/biometric.dart';
import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
import 'package:futureit/authentication/verification/mailverification.dart';
import 'package:futureit/exceptions/signup_emailpassword_fail.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/onboardingscreen.dart';
import 'package:futureit/pin/entrypin.dart';
import 'package:futureit/pin/pin.dart';
import 'package:futureit/pin/pinentryscreen.dart';
import 'package:futureit/user_info/gender.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepositary extends GetxController{
  static AuthenticationRepositary get instance => Get.find();

  //variables

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;



  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    // setInitialScreen(firebaseUser.value);
  }
  

  _setInitialScreen(User? user)async{
    // user == null? Get.offAll(()=>  gender() ) :

    final pin = await getPin();

    user == null? Get.offAll(()=> onboarding() ) :
    //  user.emailVerified? 
    // Get.offAll(()=> Dashboard()) ;
     pin == null ? 
      Get.off(Dashboard()) :
      Get.offAll(()=> BiometricScreen());
    //  Get.offAll(()=> PinEntryScreen(pin!));
    //  : Get.offAll(()=> MailVerification());
  }

  
  Future<void> phoneAuthentication(String phoneNo)async{
   await _auth.verifyPhoneNumber(
      phoneNumber:'+91'+phoneNo,
      verificationCompleted: (credential)async{
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e){
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong , Try again');
        }
      } ,
      codeSent: (verificationId, resendToken){
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId){
        this.verificationId.value = verificationId;
      });
  
  }

  // signInWithGoogle() async {
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );

  //   return await FirebaseAuth.instance.signInWithCredential(credential);

  // }

//   Future<User?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
//     if (googleSignInAccount == null) return null;

//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     final UserCredential authResult =
//         await FirebaseAuth.instance.signInWithCredential(credential);

//     return authResult.user;
//   } catch (e) {
//     print("Error signing in with Google: $e");
//     return null;
//   }
// }


  Future<bool> verifyOTP(String otp)async{
   var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));

   return credentials.user != null? true:false;
  }
  
  void createUserWithEmailandPassword(String email,String password)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // Get.to(()=>otpscreen());
      firebaseUser.value != null ? Get.offAll(()=> otpscreen()) : Get.back();
    } on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase exception - ${ex.message}');
      Get.snackbar('Error','$e');
      Get.back();
      throw ex;
    }catch(_){
      final ex = SignUpWithEmailAndPasswordFailure();
      Get.back();
      print('Exception- ${ex.message}');
      throw ex;
    }
  }



  Future<void> loginWithEmailAndPassword(String email, String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(()=> Dashboard()) : Get.to(()=> onboarding());
    } on FirebaseAuthException catch(e){
      Get.snackbar("Error", "$e",
      snackPosition: SnackPosition.BOTTOM );
    } catch(_){}
  }

  Future<void> logout()async=> await _auth.signOut().then((value) => Get.to(loginscreen()));

  Future<void> sendEmailVerification()async{
    
    try{
     await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException {
      Get.snackbar("Error", "There was some error in verification of the mail",
      colorText: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
    }
    catch(_){

    }
  }


}