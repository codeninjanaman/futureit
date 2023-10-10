import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/user_info/income.dart';
import 'package:futureit/user_info/maritalstatus.dart';

import '../constants.dart';

class occupation extends StatefulWidget {
  @override
  _occupationState createState() => _occupationState();
}

class _occupationState extends State<occupation> {

  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  int selectedoccupationIndex = -1;
  List<String> occupation= ['Private Sector Service', 'Public Sector Service', 'Government Service','Housewife','Student','Self Employed','Business','Professional','Retired','Farmer','Service','Agriculturist'];
  // To store the selected gender

  

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
          
      
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Occupation',
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
      
                      Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: occupation.asMap().entries.map((entry) {
              final index = entry.key;
              final gender = entry.value;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedoccupationIndex = index;
                      String occupationselected = occupation[selectedoccupationIndex];
                      _db.collection("Users").doc(docID).update({"Occupation": "$occupationselected"});
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => income(),
                      ),
                    );
                  },
                  child: Text(gender,
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    primary: selectedoccupationIndex == index
                        ? Colors.green
                        : Colors.grey[800],
                  ),
                ),
              );
            }).toList(),
                      )
      
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
