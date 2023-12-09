import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/profile/getdetails.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class userinfo extends StatefulWidget {
  const userinfo({super.key});

  @override
  State<userinfo> createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
   final _authRepo = Get.put(AuthenticationRepositary());
   
  Future<QuerySnapshot<Map<String, dynamic>>>? _userDataFuture;

   @override
  void initState() {
    super.initState();
    final email = _authRepo.firebaseUser.value?.email;
    if(email!=null){
       _userDataFuture = getUserData(email);
    }
   
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserData(String email) {
    
    return FirebaseFirestore.instance.collection('Users').where('Email',isEqualTo: email).get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        title: Text('User Info',
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
      body:Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userinfowidget(size: size, dataname: 'Name(as on PAN CArd)', data: 'FullName', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Mobile Number', data: 'Phone', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Email', data: 'Email', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Marital Status ', data: 'Marital Status', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Gender', data: 'Gender', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Occupation Status', data: 'Occupation', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Income', data: 'Income', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'PAN Card', data: 'PAN Card', userDataFuture: _userDataFuture),
              userinfowidget(size: size, dataname: 'Adhaar Card', data: 'Adhaar Card', userDataFuture: _userDataFuture),
              // userinfowidget(size: size, dataname: 'Father Name', data: '', userDataFuture: _userDataFuture),
            ],
          ),
        ),
      )
      //
      // Center(
      //   child: 
      //   getdetails(userDataFuture: _userDataFuture,detailname: 'Email',),
      // ),
    );
  }
}

class userinfowidget extends StatelessWidget {
  const userinfowidget({
    super.key,
    required this.size,
    required this.dataname,
    required this.data,
    required Future<QuerySnapshot<Map<String, dynamic>>>? userDataFuture,
  }) : _userDataFuture = userDataFuture;

  final Size size;
  final Future<QuerySnapshot<Map<String, dynamic>>>? _userDataFuture;
  final String dataname;
  final String data;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dataname,
    style: GoogleFonts.inter(
      textStyle: TextStyle(
        color: Pallete.black,
        fontWeight: FontWeight.w500,
        fontSize: 12
      )
    ),),
    SizedBox(height: 2,),
      
    Container(
      padding: EdgeInsets.all(14),
      height: size.height*0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Pallete.black.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Align(
        alignment: Alignment.topLeft,
        child: getdetails(userDataFuture: _userDataFuture, detailname: data))),
    ),
    SizedBox(height: size.height*0.021,)

        ],
      ),
    );
  }
}

