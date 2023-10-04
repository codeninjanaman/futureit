import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/login/loginheader.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/signup.dart/signupform.dart';

import '../authentication_repositary/authentication_repositary.dart';

class signupscreen extends StatelessWidget {
  const signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loginheader(size: size, image: "assets/images/four.png", title: "Get On Board!", subTitle: "Create your profile to start your journey"),
                  signupform(),
                  Column(
                    children: [
                      Text("OR",
                      style: TextStyle(
                        color: Colors.white
                      ),),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            // shape: BeveledRectangleBorder(),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.white, // Set the desired border color here
                width: 1.0,
                 // Set the desired border width here
              ),
            ),
          ),
                          // style: OutlinedButton.styleFrom(
                          //   shape: BeveledRectangleBorder(),
                            
                          // ),
                          onPressed: (){
                            AuthenticationRepositary.instance.signInWithGoogle();
                          }, 
                        icon: Image(image: AssetImage('assets/images/five.png', ),
                        width: 20,),
                        label: Text("Sign-In with Google",
                        style: TextStyle(
                          color: Colors.white
                        ),))
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
          );
                      },
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white
                          )),
                          TextSpan(text: "Login",
                          style: TextStyle(color: Pallete.color1 ))
                        ]
                        )
                      ))
                    ],
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

