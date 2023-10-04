import 'package:flutter/material.dart';

class onboardingtwo extends StatelessWidget {
  const onboardingtwo({super.key});

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
                  width: size.width,
                  height: size.height*0.4,
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/four.png'),
                ),
                SizedBox(height: size.height*0.05,),
                Text("EXPLORE FEATURES",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight:FontWeight.bold 
                ),),
                SizedBox(height: size.height*0.01,),
                
                Text(
                  "Stay ahead with real-time market updates, intuitive trade execution, and expert insights to guide your strategies",
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