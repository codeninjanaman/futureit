import 'package:flutter/material.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/login/forgetpasswordmodalsheet.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/signupcontroller.dart';
// import 'package:futureit/login/forgetpasswordwidget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(child: 
    Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 50,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(Icons.person_outline_outlined),
          //       labelText: "Email",
          //       hintText: "Email",
          //       border: OutlineInputBorder()
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 50,
            child: TextFormField(
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              controller: controller.email,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("E-Mail",
                style: TextStyle(fontSize: 15,
                color: Colors.white),),
                prefixIcon: Icon(Icons.email_outlined,
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
          SizedBox(height: size.height*0.02,),
          SizedBox(
            height: 50,
            child: TextFormField(
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              controller: controller.password,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("Password",
                style: TextStyle(fontSize: 15,
                color: Colors.white),),
                prefixIcon: Icon(Icons.fingerprint,
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
          // SizedBox(
          //   height: 50,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(Icons.fingerprint),
          //       labelText: "Password",
          //       hintText: "Password",
          //       border: OutlineInputBorder(),
          //       suffixIcon: IconButton(
          //         onPressed: (){},
          //         icon: Icon(Icons.remove_red_eye_sharp),
          //       )
          //     ),
          //   ),
          // ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){
            ForgetPasswordScreen.buildShowModalBottomSheet(context);
            }, child: Text("Forgot Password?",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white, 
            decorationThickness: 1.0,
              fontSize: 13
            ),))
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: ()async{
                  AuthenticationRepositary.instance.loginWithEmailAndPassword(controller.email.text.trim(), controller.password.text.trim());
                  DateTime loginTime = DateTime.now();
                  SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('loginTime', loginTime.toString());
                },
                child: Text("LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.color1,
                  shape: BeveledRectangleBorder()
                ),
              ),
            )
        ],
      ),
    ));
  }

 
}

