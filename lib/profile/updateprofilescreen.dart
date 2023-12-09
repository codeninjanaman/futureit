// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureit/authentication/models/user_model.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/controller/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Updateprofile extends StatelessWidget {
  const Updateprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: ()=>Get.back(),
        icon: Icon(LineAwesomeIcons.angle_left,
        color: Colors.white,)),
        title: Text('Update Profile',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white
        ),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  
                  UserModel user = snapshot.data as UserModel;
                  
                  final email =TextEditingController(text: user.email);
                  final password =TextEditingController(text: user.password);
                  final fullName =TextEditingController(text: user.fullName);
                  final phoneNO =TextEditingController(text: user.phoneNo);
                 return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        child: Icon(Icons.person,
                        color: Colors.white,
                        size: 80,),
                      ),
                      ),
                      
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                             width: 30,
                             height: 30,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100),
                               color: Pallete.color2
                             ),
                             child: Icon(LineAwesomeIcons.camera,
                             size: 15,
                             color: Colors.white,),
                           ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                Form(child: Column(
                  children: [
                    SizedBox(
              height: 50,
              child: TextFormField(
                controller: fullName,
                style: TextStyle(
                  color: Colors.white
                ),
              
                decoration:  InputDecoration(
                  label: Text("Full Name",
                  style: TextStyle(fontSize: 15),),
                  prefixIcon: Icon(Icons.person_outline_rounded,
                  color: Colors.white,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  labelStyle: TextStyle(color:Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(width: 2.0,
                    color:Color.fromARGB(221, 44, 42, 42))
                  )
                  
                )
              ),
            ),
            SizedBox(height: 10,),
                    SizedBox(
              height: 50,
              child: TextFormField(
                
                controller: email,
                style: TextStyle(
                  color: Colors.white
                ),
                
                decoration: InputDecoration(
                  label: Text("E-Mail",
                  style: TextStyle(fontSize: 15),),
                  prefixIcon: Icon(Icons.email_outlined,
                  color: Colors.white,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
          
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(width: 2.0,
                    color:Color.fromARGB(221, 44, 42, 42))
                  )
                  
                )
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: phoneNO,
                style: TextStyle(
                  color: Colors.white
                ),
                
                decoration:  InputDecoration(
                  label: Text("Phone No",
                  style: TextStyle(fontSize: 15),),
                  prefixIcon: Icon(Icons.phone,
                  color: Colors.white,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(width: 2.0,
                    color:Color.fromARGB(221, 44, 42, 42))
                  )
                  
                )
              ),
            ),
            SizedBox(height: 10,),
            
            // SizedBox( 
            //   height: 50,
            //   child: TextFormField(
            //     controller: password,
            // style: TextStyle(
            //       color: Colors.white
            //     ),
            //     decoration:  InputDecoration(
            //       label: Text("Password",
            //       style: TextStyle(fontSize: 15),),
            //       prefixIcon: Icon(Icons.fingerprint,
            //       color: Colors.white,),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(100),
            //       ),
            //       labelStyle: TextStyle(color:Colors.white),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(100),
            //         borderSide: BorderSide(width: 2.0,
            //         color:Color.fromARGB(221, 44, 42, 42))
            //       )
                  
            //     )
            //   ),
            // ),
            SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()async{
                    final userData = UserModel(
                      fullName: fullName.text.trim(),
                      // fathername: '',
                      email: email.text.trim(),
                      phoneNo: phoneNO.text.trim(),
                      password: password.text.trim());
                      await controller.updateRecord(userData);

                  }, child: Text("Edit Profile",
                  style: TextStyle(
                    color: Pallete.color2
                  ),),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.grey.shade50,
                    side: BorderSide.none
                    
                  ),),
          
                ),
                  ],
                ))
              ],
            );
                }
                else if(snapshot.hasError){
                return Center (child :Text(snapshot.error.toString()));
              }
              else {
                return Text("Something went  wrong");
              }
              } 
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            
          ),
        ),
      )
    );
  }
}