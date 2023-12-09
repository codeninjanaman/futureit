import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class portfolio extends StatefulWidget {
  const portfolio({super.key});

  @override
  State<portfolio> createState() => _portfolioState();
}

class _portfolioState extends State<portfolio> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.white,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Pallete.white,
        title: Text('Portfolio',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 16,
          color: Pallete.black
        ),
        )
        ),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,
        color: Pallete.black,))
      ),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                
                
                style: TextStyle(color: Pallete.black,
              
                fontSize: 12),
                
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                  color: Pallete.black),
                  contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.inter(
                    textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13
      
                  ),
                  ),
                  
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  
                  labelStyle: TextStyle(color: Pallete.color1 ),
                  focusedBorder: OutlineInputBorder(
                    // borderSide: BorderSide(width: 2.0,
                    // color:Pallete.color2)
                  )
                  
                )
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 4, // Blur radius
        offset: Offset(3, 3), // Offset in the y direction
      ),
    ],
                  color: Pallete.yellow1,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total P&L',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13
                    ),
                    )),
                    SizedBox(height: 3,),
                    Text('+0.0000',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13
                    ),)
                  ],
                ),
                
              ),

              SizedBox(height: 10,),
               
               Center(
                 child: Text.rich(
                         TextSpan(
                         text: "Total Positions : ",
                         style: TextStyle(color: Pallete.black,
                         fontSize: 13),
                         children: [
                           TextSpan(
                             text: "4",
                             style: TextStyle(
                  color: Pallete.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                             )
                           )
                         ]
                       )),
               ),

               SizedBox(height: 12,),
                  ],
                ),
              )
               ,
               
            ],
          ),
        )
      )
    );
  }
}


