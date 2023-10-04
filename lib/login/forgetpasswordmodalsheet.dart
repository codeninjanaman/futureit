import 'package:flutter/material.dart';
import 'package:futureit/authentication/forgotpassword/forgotpasswordmail.dart';
import 'package:futureit/authentication/forgotpassword/forgotpasswordphone.dart';

import 'forgetpasswordwidget.dart';
class ForgetPasswordScreen{
    static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
              context: context,
              builder: (context)=>Container(
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
                padding: const EdgeInsets.all(25),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Make Selection!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    Text("Select one of the options given below to reset your password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),),
                    SizedBox(height: 30,),
                    forgetpasswordwidget(btnIcon: Icons.mail_outline_rounded,
                    title: "E-Mail",
                    subtitle: "Reset via Mail Verification",
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordMailScreen()));
                    }),
                    SizedBox(height: 20,),

                    forgetpasswordwidget(
                      btnIcon: Icons.mobile_friendly_rounded,
                      title: "Phone No",
                      subtitle: "Reset via Phone Verification", onTap: (){
                        Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordPhoneScreen()));
                      })

                  ],
                ),
              ));
  }
}