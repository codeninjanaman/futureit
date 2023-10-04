import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/user_info/adhaarcard/adhaarcardupload.dart';

class adhaarcardscreenone extends StatelessWidget {
  const adhaarcardscreenone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
      
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(height: 40,),
                      Text("Enter Adhaar Card",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
      SizedBox(height: 8,),
                Text("Adhaar card is compulsory for investing in Bharat.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13
                ),),
      SizedBox(height: 20,),
                TextFormField(
                
                
                style: TextStyle(color: Pallete.color2,
              
                fontSize: 14),
                
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  hintText: '0123 4567 8900',
                  hintStyle: TextStyle(
                    color: Pallete.color2,
      
                  ),
                  
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Pallete.color1 ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0,
                    color:Pallete.color2)
                  )
                  
                )
              ),
                    ],
                  ),
                )
                ,
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){

                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AadhaarUploadScreen(),
                    ),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)
                    ),
                    backgroundColor: Pallete.color1
                  ),
                   child: Text('Next', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),
                  )),
                )
      
      
              ],
            ),
          ),
        ),
      ),
      
      
      );
  }
}