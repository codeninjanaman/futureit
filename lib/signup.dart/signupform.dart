import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
import 'package:futureit/authentication/models/user_model.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/controller/signupcontroller.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:get/get.dart';
class signupform extends StatelessWidget {
  const signupform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    // final _formkey = GlobalKey<FormState>();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child:  FormBuilder (
        // key: _formKey,
        child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: TextFormField(
              // autofocus: true,
              
              
              
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              controller: controller.fullName,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("Full Name",
                style: TextStyle(fontSize: 13,
                color: Colors.white),),
                prefixIcon: Icon(Icons.person_outline_rounded,
                color: Colors.white,
                size: 20,),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0,
                  color: Colors.white)
                )
                
              )
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 50,
            child: TextFormField(
              validator: (value){
                 if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
              },
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              controller: controller.email,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("E-Mail",
                style: TextStyle(fontSize: 13,
                color : Colors.white),),
                prefixIcon: Icon(Icons.email_outlined,
                size: 20,
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
          SizedBox(height: 10,),
          SizedBox(
            height: 50,
            child: TextFormField(
              validator: (value){
                if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!value.startsWith('+91') || value.length != 13) {
      return 'Invalid phone number format';
    }
    return null;
              },
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("Phone No",
                style: TextStyle(fontSize: 13,
                color : Colors.white),),
                prefixIcon: Icon(Icons.phone,
                size: 20,
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
          SizedBox(height: 10,),
          
          SizedBox( 
            height: 50,
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              controller: controller.password,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                
                // helperText:"Password must contain special character",
                //     helperStyle:TextStyle(color:Colors.green),
                label: Text("Password",
                style: TextStyle(fontSize: 13,
                color : Colors.white),),
                prefixIcon: Icon(Icons.fingerprint,
                color: Colors.white,
                size: 20,),
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
            child: ElevatedButton(onPressed: (){

              // _formKey.currentState!.validate();
              // if(_formKey.currentState!.validate()){
                
                

                final user = UserModel(fullName: controller.fullName.text.trim(),
                email: controller.email.text.trim(),
                // fathername: '',
                phoneNo: controller.phoneNo.text.trim(),
                password: controller.password.text.trim());

                SignUpController.instance.registerUser(controller.email.text.trim(),
                 controller.password.text.trim());
                SignUpController.instance.createUser(user);
                SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
    //             Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => PanCardUploadPage(),
    //   ),
    // );
              // }
            }, child: Text("SIGNUP",
            style: TextStyle(
              color: Colors.white
            ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.color1,
              shape: BeveledRectangleBorder()
            ),
            ))

        ],

      )),
    );
  }
}












// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// // import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
// import 'package:futureit/authentication/models/user_model.dart';
// import 'package:futureit/authentication_repositary/authentication_repositary.dart';
// import 'package:futureit/constants.dart';
// import 'package:futureit/controller/signupcontroller.dart';
// import 'package:futureit/user_info/pancard.dart';
// import 'package:get/get.dart';
// class signupform extends StatelessWidget {
//   const signupform({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//     // final _formkey = GlobalKey<FormState>();
//      final CollectionReference collection =
//       FirebaseFirestore.instance.collection('Users');
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child:  FormBuilder (
//         // key: _formKey,
//         child: 
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 50,
//             child: TextFormField(
//               // autofocus: true,
              
              
              
//               style: TextStyle(color: Colors.white,
//               fontSize: 14),
//               controller: controller.fullName,
//               decoration:  InputDecoration(
//                 contentPadding: EdgeInsets.only(bottom: 1),
//                 label: Text("Full Name",
//                 style: TextStyle(fontSize: 13,
//                 color: Colors.white),),
//                 prefixIcon: Icon(Icons.person_outline_rounded,
//                 color: Colors.white,
//                 size: 20,),
//                 border: OutlineInputBorder(),
//                 labelStyle: TextStyle(color: Colors.grey.shade200),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2.0,
//                   color: Colors.white)
//                 )
                
//               )
//             ),
//           ),
//           SizedBox(height: 10,),
//           SizedBox(
//             height: 50,
//             child: TextFormField(
//               validator: (value){
//                  if (value == null || value.isEmpty) {
//                     return 'Email is required';
//                   }
//                   if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
//                     return 'Invalid email format';
//                   }
//                   return null;
//               },
//               style: TextStyle(color: Colors.white,
//               fontSize: 14),
//               controller: controller.email,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.only(bottom: 1),
//                 label: Text("E-Mail",
//                 style: TextStyle(fontSize: 13,
//                 color : Colors.white),),
//                 prefixIcon: Icon(Icons.email_outlined,
//                 size: 20,
//                 color: Colors.white,),
//                 border: OutlineInputBorder(),
//                 labelStyle: TextStyle(color: Color.fromARGB(221, 44, 42, 42)),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2.0,
//                   color:Colors.white)
//                 )
                
//               )
//             ),
//           ),
//           SizedBox(height: 10,),
//           SizedBox(
//             height: 50,
//             child: TextFormField(
//               validator: (value){
//                 if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (!value.startsWith('+91') || value.length != 13) {
//       return 'Invalid phone number format';
//     }
//     return null;
//               },
//               style: TextStyle(color: Colors.white,
//               fontSize: 14),
//               controller: controller.phoneNo,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.only(bottom: 1),
//                 label: Text("Phone No",
//                 style: TextStyle(fontSize: 13,
//                 color : Colors.white),),
//                 prefixIcon: Icon(Icons.phone,
//                 size: 20,
//                 color: Colors.white,),
//                 border: OutlineInputBorder(),
//                 labelStyle: TextStyle(color: Color.fromARGB(221, 44, 42, 42)),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2.0,
//                   color:Colors.white)
//                 )
                
//               )
//             ),
//           ),
//           SizedBox(height: 10,),
          
//           SizedBox( 
//             height: 50,
//             child: TextFormField(
//               obscureText: true,
//               style: TextStyle(color: Colors.white,
//               fontSize: 14),
//               controller: controller.password,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.only(bottom: 1),
                
//                 // helperText:"Password must contain special character",
//                 //     helperStyle:TextStyle(color:Colors.green),
//                 label: Text("Password",
//                 style: TextStyle(fontSize: 13,
//                 color : Colors.white),),
//                 prefixIcon: Icon(Icons.fingerprint,
//                 color: Colors.white,
//                 size: 20,),
//                 border: OutlineInputBorder(),
//                 labelStyle: TextStyle(color: Color.fromARGB(221, 44, 42, 42)),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2.0,
//                   color:Colors.white)
//                 )
                
//               )
//             ),
//           ),
//           SizedBox(height: 20,),

//           SizedBox(
//             height: 50,
//             width: double.infinity,
//             child: ElevatedButton(onPressed: ()async{

//               // _formKey.currentState!.validate();
//               // if(_formKey.currentState!.validate()){
                
                

//                 // final user = UserModel(fullName: controller.fullName.text.trim(),
//                 // email: controller.email.text.trim(),
//                 // // fathername: '',
//                 // phoneNo: controller.phoneNo.text.trim(),
//                 // password: controller.password.text.trim());

//                 // SignUpController.instance.registerUser(controller.email.text.trim(),
//                 //  controller.password.text.trim());
                
//                 SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

//                 DocumentReference documentReference = await collection.add({
//           'name': controller.fullName.text.trim(),
//           'email':controller.email.text.trim(),
//           'phoneNO':controller.phoneNo.text.trim(),
//           'password':controller.password.text.trim()

          
//     });

//     SignUpController.instance.registerUser(controller.email.text.trim(),
//                  controller.password.text.trim());
//                 //  SignUpController.instance.createUser(user);
//     Pallete.documentId = documentReference.id;
//     //             Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => PanCardUploadPage(),
//     //   ),
//     // );
//               // }
//             }, child: Text("SIGNUP",
//             style: TextStyle(
//               color: Colors.white
//             ),),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Pallete.color1,
//               shape: BeveledRectangleBorder()
//             ),
//             ))

//         ],

//       )),
//     );
//   }
// }