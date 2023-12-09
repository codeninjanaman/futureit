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
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/signup.dart/verificationscreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../authentication/models/user_model.dart';
import '../authentication_repositary/authentication_repositary.dart';
import '../controller/signupcontroller.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {

  bool _isEmailValid = false;

  Future<void> _sendVerificationEmail(BuildContext context) async {
    try {
      if (_isEmailValid) {
        // Send email verification
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          // Navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NextScreen()),
          );
        }
      } else {
        // Handle invalid email scenario
        print('Please enter a valid email address.');
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
    }
  }
  
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(SignUpController());
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (value.length > 30) {
      return 'Username should not exceed 30 characters';
    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return 'Username should contain only letters';
    }
    return null;
  }

  String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  } else if (!value.endsWith('@gmail.com')) {
    return 'Please enter a Gmail address';
  }
  return null;
}

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    } else if (value.length != 10) {
      return 'Please enter a valid Indian mobile number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password should be at least 6 characters';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#$&*])').hasMatch(value)) {
      return 'Password should contain an uppercase letter and a special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != controller.password.text.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }
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
            topRight: Radius.elliptical(30, 180),
            bottomRight: Radius.elliptical(320, 260),
            bottomLeft: Radius.elliptical(290, 80)
          ),
          color: Pallete.yellow1, 
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
                            child: Text('Get On Board!',
                            
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                          
                            ),),
                          ),
                
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Create your profile to start\nyour journey',
                            style: TextStyle(
                              color: Colors.black,
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
                  controller: controller.fullName,
                  validator: validateUsername,
                  style: TextStyle(color: Colors.black,
                
                  fontSize: 14),
                  
                  decoration: InputDecoration(
                    
                    contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person,
                    size: 20,),
                    
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black,
                      width: 1)
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
                  controller: controller.email,
                  validator: validateEmail,
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
                  controller: controller.phoneNo,
                  keyboardType: TextInputType.number,
                  validator: validateMobile,
                  style: TextStyle(color: Colors.black,
                
                  fontSize: 14),
                  
                  decoration: InputDecoration(
                    prefixText: '+91 ',
                    prefixStyle: TextStyle(
                      color: Colors.black
                    ),
                    prefixIcon: Icon(Icons.flag),
                    contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  
                    hintText: 'Mobile Number',
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
                  controller: controller.password,
                  obscureText: true,
                  validator: validatePassword,
                  style: TextStyle(color: Colors.black,
                
                  fontSize: 14),
                  
                  decoration: InputDecoration(
                    
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

              SizedBox(height: size.height*0.01,),

              SizedBox(
                // height: size.height*0.06,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                 validator: validateConfirmPassword,
                  style: TextStyle(color: Colors.black,
                
                  fontSize: 14),
                  
                  decoration: InputDecoration(
                    
                    contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  
                    hintText: 'Confirm Password',
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
              SizedBox(height: size.height*0.05),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.yellow1
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       _sendVerificationEmail(context);
                      final user = UserModel(fullName: controller.fullName.text.trim(),
                email: controller.email.text.trim(),
                // fathername: '',
                phoneNo: controller.phoneNo.text.trim(),
                password: controller.password.text.trim());

                SignUpController.instance.registerUser(controller.email.text.trim(),
                 controller.password.text.trim());
                SignUpController.instance.createUser(user);
                SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                      print('Form is valid. Ready for signup!');
                    }
                  },
                  child: Text('Create Account',
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
                        label: Text("Create account with Google",
                        style: TextStyle(
                          color: Pallete.black4
                        ),))
                      ),
                      TextButton(onPressed: (){
                        Get.to(loginscreen());
                      },
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Already have an account? ",
                          style: TextStyle(
                            color: Pallete.black4,
                            fontSize: 12
                          )),
                          TextSpan(text: "Login",
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