import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/profile/profilemenuwidget.dart';
import 'package:futureit/profile/updateprofilescreen.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../authentication/models/user_model.dart';
import '../authentication_repositary/authentication_repositary.dart';
import '../controller/profilecontroller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    final controller = Get.put(ProfileController());
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(LineAwesomeIcons.angle_left,
        color: Colors.white,)),
        title: Text('Profile',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
          ,
          color: Colors.white
        ),),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(LineAwesomeIcons.moon))
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Stack(
                children: [
                  
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),
                    child: Icon(Icons.person,
                    color: Colors.white,
                    size: 80,),
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
                           child: Icon(LineAwesomeIcons.alternate_pencil,
                           size: 15,
                           color: Colors.white,),
                         ),
                  )
                ],
              ),
              SizedBox(
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData){
                        UserModel user = snapshot.data as UserModel;
                        return Text(user.fullName.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),);
                        
                      }
                    }
                    return Text("Loading");
                  
                  }),
              ),

              SizedBox(
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData){
                        UserModel user = snapshot.data as UserModel;
                        return Text(user.email.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          
                        ),);
                        
                      }
                    }
                    return Text("Loading");
                  
                  }),
              ),
            
              // Text("Naman Verma",
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 18,
              //   fontWeight: FontWeight.bold
              // ),),
              // Text("namuv7@gmail.com",
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 15,
              // ),),
              SizedBox(height: 20,),
              SizedBox(
                width: 200,
                child: ElevatedButton(onPressed: ()=>Get.to(()=>Updateprofile()), child: Text("Edit Profile",
                style: TextStyle(
                  color: Pallete.color2
                ),),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.grey.shade50,
                  side: BorderSide.none
                  
                ),),

              ),
              SizedBox(height: 30,),
               Divider(),
               SizedBox(height: 10,),
               Profilemenuwidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: (){}),
               Profilemenuwidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: (){}),
               Divider(color: Colors.grey,),
               SizedBox(height: 10,),
               Profilemenuwidget(title: "Information", icon: LineAwesomeIcons.info, onPress: (){}),
               Profilemenuwidget(title: "Logout", icon: LineAwesomeIcons.alternate_sign_out, onPress: (){
                AuthenticationRepositary.instance.logout();
               },
               textColor: Colors.red,
               endIcon: false,
               ),
            ],
          ),
        ),
      ),
    );
  }
}

