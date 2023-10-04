import 'package:flutter/material.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/controller/mail_verification_controller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(

        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LineAwesomeIcons.envelope_open, size: 100,),
            SizedBox(
              height: 20,
            ),
            Text("Verify Your Email",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),

            SizedBox(
              width: 200,
              child: OutlinedButton(onPressed: ()=> controller.manuallyCheckEmailVerificationStatus(),
              child: Text("Manual")),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: ()=> controller.sendVerificationEmail(),
            child: Text("Resend Email Link")),
            TextButton(onPressed: ()=> AuthenticationRepositary.instance.logout(),
            child: Text("Logout"))

        ],)),
      ),
    );
  }
}