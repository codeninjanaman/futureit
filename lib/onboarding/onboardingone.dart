import 'package:flutter/material.dart';

class onboardingone extends StatelessWidget {
  const onboardingone({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
        body: Center(
          child: Column(
          
            
            children: [
              SizedBox(height: size.height*0.12,),
              Image(
                  width: size.width*0.77,
                  height: size.height*0.35,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/onboarding.png'),
                ),
                SizedBox(height: size.height*0.05,),
                Text("GET STARTED",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight:FontWeight.bold 
                ),),
                SizedBox(height: size.height*0.01,),
                
                Text(
                  "Discover a world of trading and investing at your fingertips. Make informed decisions and seize opportunities in the markets",
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}