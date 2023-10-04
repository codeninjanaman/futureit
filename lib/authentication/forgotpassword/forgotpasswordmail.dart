import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:get/get.dart';
// import 'package:futureit/login/loginheader.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  State<ForgetPasswordMailScreen> createState() => _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose;
    super.dispose();
  }

  Future PasswordReset()async{

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailcontroller.text.trim());
      Get.snackbar('Success', 'Please Check your email and reset the password and login to continue',
      colorText: Colors.green,);
      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
    } on FirebaseAuthException catch(e){
      Get.snackbar('Error', '$e');

    }
    

  }

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
                    Text("Reset Password",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("Please enter the mail address you have registered with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),),
                    SizedBox(height: 20,),
                    SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: _emailcontroller,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text("E-Mail",
                      style: TextStyle(fontSize: 15),),
                      prefixIcon: Icon(Icons.email_outlined,
                      color: Colors.white,),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white),
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
                    onPressed: PasswordReset,
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