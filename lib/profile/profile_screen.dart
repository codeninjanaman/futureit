import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/profile/addbroker.dart';
import 'package:futureit/profile/profilemenuwidget.dart';
import 'package:futureit/profile/updateprofilescreen.dart';
import 'package:futureit/profile/user_info.dart';
import 'package:futureit/theme.dart';
import 'package:futureit/user_info/pancardtextfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../authentication/models/user_model.dart';
import '../authentication_repositary/authentication_repositary.dart';
import '../controller/profilecontroller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    final controller = Get.put(ProfileController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.white,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey.shade400, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(LineAwesomeIcons.angle_left,
        color: Pallete.black,)),
        title: Text('Profile',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold
            
            color: Pallete.black
          ),
          ) 
          ),
        
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
                      height: 100,
                      width: 100,
                      child: ClipRRect(borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Pallete.black,
                            width: 1
                          )
                        ),
                        child: Icon(Icons.person,
                        color: Pallete.black,
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
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                        )
                        );
                        
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
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 12,
                          
                        )
                        )
                        ,);
                        
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
                height: size.height*0.05,
                width: size.width*0.6,
                child: ElevatedButton(onPressed: ()=>Get.to(()=>Updateprofile()), child: Text("Edit Profile",
                style: TextStyle(
                  color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Pallete.black1,
                  side: BorderSide.none
                  
                ),),

              ),
              SizedBox(height: size.height*0.08,),
               Profilemenuwidget(title: "Complete KYC", icon: LineAwesomeIcons.cog, onPress: (){
                Get.to(pancardentry());
               }),
               Container(
                width: double.infinity,
                color: Pallete.black,
               height: 0.1,),
               Profilemenuwidget(title: "Link Demat Account", icon: LineAwesomeIcons.book, onPress: (){
                Get.to(brokerscreen());
               }),

               Container(
                width: double.infinity,
                color: Colors.black,
               height: 0.1,),
               Profilemenuwidget(title: "User Info", icon: LineAwesomeIcons.user_check, onPress: (){
                Get.to(userinfo());
               }),
               SizedBox(height: size.height*0.06,),
               ElevatedButton(
              onPressed: () {
                Get.find<ThemeController>().toggleTheme();
              },
              child: Text('Toggle Theme'),
            ),
               Container(
                  height: size.height*0.09,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(onPressed: (){
                    AuthenticationRepositary.instance.logout();
                  }, child: Text('LOGOUT',
                  style: TextStyle(
                    color: Colors.white,
                
                  ),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    backgroundColor: Colors.red
                  ),),
                )
              //  Profilemenuwidget(title: "Logout", icon: LineAwesomeIcons.alternate_sign_out, onPress: (){
              //   AuthenticationRepositary.instance.logout();
              //  },
              //  textColor: Colors.red,
              //  endIcon: false,
              //  ),
            ],
          ),
        ),
      ),
    );
  }
}

