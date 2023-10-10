import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/user_info/maritalstatus.dart';

class gender extends StatefulWidget {
  @override
  _genderState createState() => _genderState();
}

class _genderState extends State<gender> {
  Color maleButtonColor = Colors.grey.shade800;
  Color femaleButtonColor = Colors.grey.shade800;
  Color otherButtonColor = Colors.grey.shade800;
  String selectedGender = ''; 
  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  
  // To store the selected gender

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
      if (gender == 'Male') {
        maleButtonColor = Colors.green; // Change the button color
        femaleButtonColor = Colors.grey.shade800;
        otherButtonColor = Colors.grey.shade800;
        _db.collection("Users").doc(docID).update({"Gender": "Male"});
      } else if (gender == 'Female') {
        maleButtonColor = Colors.grey.shade800;
        femaleButtonColor = Colors.green; // Change the button color
        otherButtonColor = Colors.grey.shade800;
        _db.collection("Users").doc(docID).update({"Gender": "Female"});
      } else if (gender == 'Other') {
        maleButtonColor = Colors.grey.shade800;
        femaleButtonColor = Colors.grey.shade800;
        otherButtonColor = Colors.green; 
        _db.collection("Users").doc(docID).update({"Gender": "Other"});// Change the button color
      }

      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => maritalstatus(),
      ),
    );
    });
  }

  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,
            color: Colors.white,)),
          ),
          // body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () => selectGender('Male'),
          //         child: Text('Male'),
          //       ),
          //       ElevatedButton(
          //         onPressed: () => selectGender('Female'),
          //         child: Text('Female'),
          //       ),
          //       ElevatedButton(
          //         onPressed: () => selectGender('Other'),
          //         child: Text('Other'),
          //       ),
          //       Text('Selected Gender: $selectedGender'),
          //       ElevatedButton(
          //         onPressed: () {
          //           // TODO: Store selectedGender in Firebase Firestore
          //         },
          //         child: Text('Save to Firebase'),
          //       ),
          //     ],
          //   ),
          // ),
      
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gender',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),),
      
                      SizedBox(
                        height: 5,
                      ),
                      Text('Select one of the options',
                      style: TextStyle(
                        color: Colors.white,
                      
                      )
                      ),
                      SizedBox(height: 15,),
      
                      Row(
                children: [
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      primary: maleButtonColor,
                      ),
                      onPressed: (){
                        selectGender('Male');
                      },
                      child: Text("Male",
                      style: TextStyle(
                        color: Colors.white
                      )))),
                  
                  SizedBox(width: 10,),
      
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      primary: femaleButtonColor,
                      ),
                      onPressed: (){
                        selectGender('Female');
                      },
                      child: Text("Female",
                      style: TextStyle(
                        color: Colors.white
                      )))),
                  
                  
                ],
              ),
      
              SizedBox(height: 15,),
      
              Row(
                children: [
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      primary: otherButtonColor,
                      ),
                      onPressed: (){
                        selectGender('Other');
                      },
                      child: Text("Other",
                      style: TextStyle(
                        color: Colors.white
                      )))),
                  
                  SizedBox(width: 167,),
      
                  
      
                  
                  
                  
                ],
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
