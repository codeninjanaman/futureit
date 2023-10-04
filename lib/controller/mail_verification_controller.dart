import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:get/get.dart';
import 'dart:async';

class MailVerificationController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerforAutoRedirect();
  }

  Future <void> sendVerificationEmail()async{
    try{
      await AuthenticationRepositary.instance.sendEmailVerification();
    } catch(e){
        Get.snackbar("Error", e.toString());
    }
  }

  void setTimerforAutoRedirect(){
    _timer = Timer.periodic(Duration(seconds: 3),
    (timer) { 
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        Get.offAll(()=>Dashboard());
        // AuthenticationRepositary.instance.setInitialScreen(user);
      }
    });
  }

  void manuallyCheckEmailVerificationStatus(){}
}