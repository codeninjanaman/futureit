// import 'package:flutter/material.dart';

// import 'loginfooter.dart';
// import 'loginform.dart';
// import 'loginheader.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
                
//                 Color(0xFF110C2C),
//                 Color(0xFFD69A38),
//               ],
//               stops: [0.41,0.7]
//             )
//           ),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.all(25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
          
//                   loginheader(size: size, image: "assets/images/four.png", title: "Welcome Back", subTitle: "Empowering your Financial Journey"),
//                   LoginForm(size: size),
//                   loginfooter()
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:futureit/constants.dart';
// import 'package:futureit/login/loginheader.dart';
// import 'package:futureit/login/loginscreen.dart';
// import 'package:futureit/signup.dart/signupform.dart';

// import '../authentication_repositary/authentication_repositary.dart';

// class signupscreen extends StatelessWidget {
//   const signupscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
                
//                 Color(0xFF110C2C),
//                 Color(0xFFD69A38),
//               ],
//               stops: [0.41,0.7]
//             )
//           ),
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: Container(
//               padding: EdgeInsets.all(25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   loginheader(size: size, image: "assets/images/four.png", title: "Get On Board!", subTitle: "Create your profile to start your journey"),
//                   signupform(),
//                   Column(
//                     children: [
//                       Text("OR",
//                       style: TextStyle(
//                         color: Colors.white
//                       ),),
//                       SizedBox(height: 20,),
//                       SizedBox(
//                         height: 50,
//                         width: double.infinity,
//                         child: OutlinedButton.icon(
//                           style: ButtonStyle(
//             side: MaterialStateProperty.all(
//               BorderSide(
//                 color: Colors.white, 
//                 width: 1.0,
//               ),
//             ),
//           ),
//                           onPressed: (){
//                             AuthenticationRepositary.instance.signInWithGoogle();
//                           }, 
//                         icon: Image(image: AssetImage('assets/images/five.png', ),
//                         width: 20,),
//                         label: Text("Sign-In with Google",
//                         style: TextStyle(
//                           color: Colors.white
//                         ),))
//                       ),
//                       TextButton(onPressed: (){
//                         Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginScreen(),
//         ),
//           );
//                       },
//                       child: Text.rich(
//                         TextSpan(children: [
//                           TextSpan(text: "Already have an account? ",
//                           style: TextStyle(
//                             color: Colors.white
//                           )),
//                           TextSpan(text: "Login",
//                           style: TextStyle(color: Pallete.color1 ))
//                         ]
//                         )
//                       ))
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/login/forgetpasswordmodalsheet.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/signup.dart/signupscreen.dart';
import 'package:futureit/signup.dart/verificationscreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/models/user_model.dart';
import '../authentication_repositary/authentication_repositary.dart';
import '../controller/signupcontroller.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool _obscureText = true;


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email = '';
  String _password = '';
  String _error = '';
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return SafeArea(
      child: Scaffold(
        body:  Stack(
            children: [
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   child: 
     Container(
        width: size.width*0.7, 
        height: size.height*0.22, 
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            // topRight: Radius.circular(5),
            topRight: Radius.elliptical(30, 180),
            bottomRight: Radius.elliptical(320, 260),
            bottomLeft: Radius.elliptical(290, 80)
          ),
          color: Pallete.black1, 
        ),
      )   ,   
                // ),

                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(height: size.height*0.03,),
                          // Text('Get On Board!',
                          // style: TextStyle(
                          //   color: Colors.black,
                          //   fontSize: 24,
                          //   fontWeight: FontWeight.w600
                          // )),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Welcome Back',
                            
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          
                            ),),
                          ),
                
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Empowering your financial\njourney',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14
                            ),),
                          ),
                
                  SizedBox(
                    height: size.height*0.15,
                  ),
   
      
       Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextFormField(
              //   controller: _usernameController,
              //   decoration: InputDecoration(labelText: 'Username'),
              //   validator: validateUsername,
              // ),
  
              SizedBox(
                // height: size.height*0.06,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {
                  _email = value;
                },
                  style: TextStyle(color: Colors.black,
                
                  fontSize: 14),
                  
                  decoration: InputDecoration(
                    
                    contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  
                    hintText: 'Gmail',
                    prefixIcon: Icon(Icons.mail,
                    size: 20,),
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

              SizedBox(height: size.height*0.01,),

              SizedBox(
                // height: size.height*0.06,
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: controller.password,
                  // obscureText: true,
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  _password = value;
                },

                  style: TextStyle(color: Colors.black,
                
                  fontSize: 14),
                  
                  decoration: InputDecoration(
                   suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
                    contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock,
                    size: 20,),
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
              if (_error.isNotEmpty)
                Text(
                  _error,
                  style: TextStyle(color: Colors.red),
                ),
                // SizedBox(height: 5,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){
            ForgetPasswordScreen.buildShowModalBottomSheet(context);
            }, child: Text("Forgot Password?",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white, 
            decorationThickness: 1.0,
              fontSize: 12
            ),))
            ),
              SizedBox(height: size.height*0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.yellow1
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()){

                      try {
                        AuthenticationRepositary.instance.loginWithEmailAndPassword(controller.email.text.trim(), controller.password.text.trim());
                  DateTime loginTime = DateTime.now();
                  SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('loginTime', loginTime.toString());
                      } on FirebaseAuthException catch(e){
                        if(e.code == 'user-not-found'){
                          setState(() {
                            _error = 'No user found for that email';
                          });
                        } else if(e.code == 'wrong-password'){
                          setState(() {
                            _error = 'Wrong password provided';
                          });
                        }
                      }
                      
                    }
                  },
                  child: Text('Login',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black
                  ),),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              Text('OR',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12
              ),),
              SizedBox(height: size.height*0.02,),

              SizedBox(
                        height: size.height*0.055,
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                color: Pallete.yellow1, 
                width: 1.0,
              ),
            ),
          ),
                          onPressed: (){
                            // AuthenticationRepositary.instance.signInWithGoogle();
                          }, 
                        icon: Image(image: AssetImage('assets/images/five.png', ),
                        width: 20,),
                        label: Text("Login with Google",
                        style: TextStyle(
                          color: Pallete.black4
                        ),))
                      ),
                      TextButton(onPressed: (){
                        Get.to(signupscreen());
                      },
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Dont\'t have an account? ",
                          style: TextStyle(
                            color: Pallete.black4,
                            fontSize: 12
                          )),
                          TextSpan(text: "Signup",
                          style: TextStyle(color: Pallete.yellow1,
                          fontSize: 12)
                          )
                        ]
                        )
                      ))
            ],
          ),
        ),
         ],
             ),
                    ),
                  ),
                )
            ],
          ),
        
      ),
    );
  }
}

