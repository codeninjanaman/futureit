import 'package:flutter/material.dart';
import 'package:futureit/authentication/forgotpassword/forgotpasswordmail.dart';
import 'package:futureit/authentication/forgotpassword/forgotpasswordphone.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';

import 'forgetpasswordwidget.dart';
class ForgetPasswordScreen{
  
    static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
              context: context,
              builder: (context)=>Container(
                height: size.height*0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),  
            color: Pallete.yellow1
          ),
                padding: const EdgeInsets.only(top: 0,right: 20,left: 20),
                child:  Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(height: 3,
                      width: size.width*0.15,
                      
                      decoration: BoxDecoration(
                        color: Pallete.white,
                        borderRadius: BorderRadius.circular(8)),),
                    ),

                    SizedBox(height: size.height*0.02,),
                    Text("Reset your password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Pallete.black1
                    ),),
                    SizedBox(height: size.height*0.005,),
                    Text("Reset your password with ease using your email",
                    style: TextStyle(
                      fontSize: 12,
                      color: Pallete.black1
                    ),),
                    // ElevatedButton(onPressed: (){}, child: Text('Send Link ->'),
                    // ),

            
                    // Positioned(
                    //   bottom: 30,
                    //   right: 20,
                    //   child: Image(image: AssetImage('assets/images/mail.png'),
                    //   height: size.height*0.08,
                    //   width: size.width*0.1,)),
                    Row(
                      children: [
                         Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        height: size.height*0.05,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Pallete.white.withOpacity(0.71)
                          ),
                          onPressed: (){
                            Get.to(ForgetPasswordMailScreen());
                          }, icon: Icon(Icons.arrow_back,
                          color: Pallete.black1,), label: Text('Send Link',
                          style: TextStyle(
                            color: Pallete.black1
                          ),)),
                      )),
                      SizedBox(width: size.width*0.2,),
                       Image(image: AssetImage('assets/images/mail.png'),
                      height: size.height*0.15,
                      width: size.width*0.2,)
                      ],
                    )
                   
                    // forgetpasswordwidget(
                    //   btnIcon: Icons.mobile_friendly_rounded,
                    //   title: "Phone No",
                    //   subtitle: "Reset via Phone Verification", onTap: (){
                    //     Navigator.pop(context);
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordPhoneScreen()));
                    //   })

                  ],
                ),
              ));
  }
}