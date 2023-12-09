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
  final _formKey = GlobalKey<FormState>();
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
                        builder: (context) => loginscreen(),
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
        child: Scaffold(
          
          appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey.shade400, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Colors.white,
        title: Text('Forgot Password',
        style: TextStyle(
          fontSize: 16,
          color: Pallete.black1
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,
        size: 18,
        color: Pallete.black1,))
      ),
          backgroundColor: Pallete.white,
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   SizedBox(height: size.height*0.06,),
                  Container(
                    padding: EdgeInsets.all(40),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3BA2F).withOpacity(0.4),
                      // borderRadius: BorderRadius.circular(100)
                    ),
                    child: Image(image: AssetImage('assets/images/lockmail.png',),
                    fit: BoxFit.contain,
                   ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Text("Please Enter your Email Address you have registered with.",
                  style: TextStyle(color: Pallete.black1),
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height*0.05,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Email Addresss',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700
                    ),),
                  ),
                   SizedBox(height: size.height*0.01,),

                   Form(
                    key: _formKey,
                     child: SizedBox(
                                   // height: size.height*0.06,
                                   child: TextFormField(
                                     controller: _emailcontroller,
                                     validator: (value){
                                     if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                                     }else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                       return 'Please enter a valid email';
                     } else if (!value.endsWith('@gmail.com')) {
                       return 'Please enter a Gmail address';
                     }
                                     return null;
                                   },
                                     style: TextStyle(color: Colors.black,
                                   
                                     fontSize: 14),
                                     
                                     decoration: InputDecoration(
                      
                      contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                                     
                      // hintText: 'E-mail',
                      // prefixIcon: Icon(Icons.mail,
                      // size: 20,),
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      labelStyle: TextStyle(color: Colors.black ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 1.0,
                        color: Colors.black)
                      )
                      
                                     )
                                   ),
                                 ),
                   ),
                //     SizedBox(
                //   height: 50,
                //   child: TextFormField(
                //     controller: _emailcontroller,
                //     style: TextStyle(color: Colors.white),
                //     decoration: InputDecoration(
                //       label: Text("E-Mail",
                //       style: TextStyle(fontSize: 15),),
                //       prefixIcon: Icon(Icons.email_outlined,
                //       color: Colors.white,),
                //       border: OutlineInputBorder(),
                //       labelStyle: TextStyle(color: Colors.white),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(width: 2.0,
                //         color:Pallete.black1)
                //       )
                      
                //     )
                //   ),
                // ), 
                SizedBox(height: size.height*0.08),
                SizedBox(
                  height: 40,
                  width: size.width*0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      backgroundColor: Pallete.yellow1,
                    ),
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        PasswordReset();
                      }
                    },
                  child: Text("Send",
                  style: TextStyle(
                    color: Pallete.black1,
                    fontSize: 14
                  ),) ),
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