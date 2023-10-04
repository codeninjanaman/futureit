import 'package:flutter/material.dart';

import 'loginfooter.dart';
import 'loginform.dart';
import 'loginheader.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  loginheader(size: size, image: "assets/images/four.png", title: "Welcome Back", subTitle: "Empowering your Financial Journey"),
                  LoginForm(size: size),
                  loginfooter()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





