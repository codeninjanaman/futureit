import 'package:flutter/material.dart';

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("Sign Up",
              style: TextStyle(
                fontSize: 48,
                color: Colors.orange
              ),),
              SizedBox(height: 40,),
              SizedBox(
            height: 50,
            child: TextFormField(
              // autofocus: true,
              
              
              
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              // controller: controller.fullName,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("Enter your mail",
                style: TextStyle(fontSize: 13,
                color: Colors.white),),
                prefixIcon: Icon(Icons.email,
                color: Colors.orange,
                size: 20,),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0,
                  color: Colors.orange)
                )
                
              )
            ),
          ),

          SizedBox(height: 10,),



          SizedBox(
            height: 50,
            child: TextFormField(
              // autofocus: true,
              
              
              
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              // controller: controller.fullName,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("University Roll No.",
                style: TextStyle(fontSize: 13,
                color: Colors.white),),
                prefixIcon: Icon(Icons.padding,
                color: Colors.orange,
                size: 20,),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0,
                  color: Colors.orange)
                )
                
              )
            ),
          ),

          SizedBox(height: 10,),

          SizedBox(
            height: 50,
            child: TextFormField(
              // autofocus: true,
              
              
              
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              // controller: controller.fullName,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("Enter Mobile Number",
                style: TextStyle(fontSize: 13,
                color: Colors.white),),
                prefixIcon: Icon(Icons.phone,
                color: Colors.orange,
                size: 20,),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0,
                  color: Colors.orange)
                )
                
              )
            ),
          ),

          SizedBox(height: 10,),

          SizedBox(
            height: 50,
            child: TextFormField(
              // autofocus: true,
              
              
              
              style: TextStyle(color: Colors.white,
              fontSize: 14),
              // controller: controller.fullName,
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                label: Text("Create Password",
                style: TextStyle(fontSize: 13,
                color: Colors.white),),
                prefixIcon: Icon(Icons.password,
                color: Colors.orange,
                size: 20,),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0,
                  color: Colors.orange)
                )
                
              )
            ),
          ),

          SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}