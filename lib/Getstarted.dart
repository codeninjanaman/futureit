import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/signup.dart/signupscreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class getstarted extends StatelessWidget {
  const getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
              iconSize: 15 ,
              icon: const Icon(Icons.arrow_back_ios),
              color: Pallete.black1,
              onPressed: () {
                Get.back();
              },
            ),  
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                      width: size.width*0.80,
                      height: size.height*0.35,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/getstarted.png'),
                    ),

                    SizedBox(height: size.height*0.05,),

                    Text('GET STARTED',
                    style: TextStyle(
                      color: Pallete.black1,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),

                    SizedBox(height: size.height*0.01,),

                    
                    Text('Stay ahead with real-time market updates, intuitive trade execution, and expert insights to guide your strategies',
                    style: TextStyle(
                      color: Pallete.black3,
                      fontSize: 12,
                    ),),

                    SizedBox(height: size.height*0.1,),
                    SizedBox(
                      width: double.infinity,
                      height: size.height*0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.yellow1
                        ),
                        onPressed: (){
                          Get.to(signupscreen());
                        }, child: Text('Create Account',
                      style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                      color: Pallete.black4,
                      fontSize: 14,
                      
                                      ),
                                    ),
                                  
                      )),
                    ),

                    SizedBox(height: size.height*0.02,),

                        SizedBox(
                          width: double.infinity,
                          height: size.height*0.05,
                          child: OutlinedButton(onPressed: (){
                            Get.to(loginscreen());
                          }, 
                          style: ButtonStyle(
                            
                                    side: MaterialStateProperty.all(
                                      BorderSide(
                                        color: Pallete.yellow1, // Set the desired border color here
                                        width: 1.0,
                                         
                                      ),
                                    ),
                                  ),
                          child: Text('Login',
                          style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                              color: Pallete.yellow1,
                                              fontSize: 14,
                                              
                                        ),
                                      ),)),
                        ),

                        SizedBox(height: size.height*0.02,),

                        Text('By creating account or logging in, you agree to our',
                        style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                              color: Pallete.black4,
                                              fontSize: 10,
                                              
                                        ),
                                      ),),
                                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Terms & Condition",
                          style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                              color: Pallete.yellow1,
                                              fontSize: 10,
                                             decoration: TextDecoration.underline, 
                                             decorationColor: Pallete.yellow1
                                        ),
                                      )
                          ),
                          TextSpan(text: " and ",
                          style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                              color: Pallete.black1,
                                              fontSize: 10,
                                        ),
                                      )),
                                      TextSpan(text: "Privacy Policy",
                          style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                              color: Pallete.yellow1,
                                              fontSize: 10,
                                             decoration: TextDecoration.underline, 
                                             decorationColor: Pallete.yellow1
                                        ),
                                      )
                          ),
                        ]
                        )
                      )
            ],
          ),
        ),
      ),
    );
  }
}