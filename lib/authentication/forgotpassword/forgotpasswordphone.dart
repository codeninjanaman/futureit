import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
// import 'package:futureit/login/loginheader.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({super.key});

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
            child: Center(
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    SizedBox(height: 110,),
                    // Image(image: AssetImage('assets/images/six.png'),
                    // height: size.height*0.2,
                    // ),
                    Icon(Icons.person,
                    color: Colors.white,
                    size: 90,),
                    SizedBox(height: 10,),
                    Text("Forgot Password",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("Please enter the phone number you have registered with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),),
                    SizedBox(height: 20,),
                    SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text("Phone No",
                      style: TextStyle(fontSize: 15,
                      color: Colors.white),),
                      prefixIcon: Icon(Icons.phone,
                      color: Colors.white,),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color.fromARGB(221, 44, 42, 42)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0,
                        color:Colors.white)
                      )
                      
                    )
                  ),
                ), 
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      backgroundColor: Pallete.color1,
                    ),
                    onPressed: (){},
                  child: Text("NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    
                  ),) ),
                )
              
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}