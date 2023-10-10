import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/authentication/forgotpassword/mobileotp.dart';
import 'package:futureit/authentication/forgotpassword/otpscreen.dart';
import 'package:futureit/user_info/maritalstatus.dart';

import '../constants.dart';

class income extends StatefulWidget {
  @override
  _incomeState createState() => _incomeState();
}

class _incomeState extends State<income> {

  final _db = FirebaseFirestore.instance;
  String docID = Pallete.documentId;
  int selectedincomeIndex = -1;
  List<String> income= ['Upto 1 Lakh', '1 Lakh - 5 Lakh', '5 Lakh - 10 Lakh','10 Lakh - 25 Lakh','25 Lakh - 50 Lakh','50 Lakh - 1 Crore','1 Crore - 5 Crore','More than 5 Crores'];
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
                  Text('Annual Income',
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
            children: income.asMap().entries.map((entry) {
              final index = entry.key;
              final gender = entry.value;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedincomeIndex = index;
                      String incomeselected = income[selectedincomeIndex];
                      _db.collection("Users").doc(docID).update({"Income": "$incomeselected"});
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
                  },
                  child: Text(gender,
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    primary: selectedincomeIndex == index
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
