import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/user_info/occupation%20.dart';

import '../constants.dart';

class maritalstatus extends StatefulWidget {
  @override
  _maritalstatusState createState() => _maritalstatusState();
}

class _maritalstatusState extends State<maritalstatus> {
  Color marriedButtonColor = Colors.grey.shade800;
  Color singleButtonColor = Colors.grey.shade800;
  String selectedmaritalstatus = ''; 
  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  
  // To store the selected gender

  void selectmaritalstatus(String maritalstatus) {
    setState(() {
      selectedmaritalstatus = maritalstatus;
      if (maritalstatus == 'Single') {
        singleButtonColor = Colors.green; // Change the button color
        marriedButtonColor = Colors.grey.shade800;
        _db.collection("Users").doc(docID).update({"Marital Status": "Single"});
      
      } else if (maritalstatus == 'Married') {
        singleButtonColor = Colors.grey.shade800;
        marriedButtonColor = Colors.green; // Change the button color
        _db.collection("Users").doc(docID).update({"Marital Status": "Married"});
      } 

      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>occupation() ,
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
                  Text('Marital Status',
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
                      primary: singleButtonColor,
                      ),
                      onPressed: (){
                        selectmaritalstatus('Single');
                      },
                      child: Text("Single",
                      style: TextStyle(
                        color: Colors.white
                      )))),
                  
                  SizedBox(width: 10,),
      
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      primary: marriedButtonColor,
                      ),
                      onPressed: (){
                        selectmaritalstatus('Married');
                      },
                      child: Text("Married",
                      style: TextStyle(
                        color: Colors.white
                      )))),
                  
                  
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
