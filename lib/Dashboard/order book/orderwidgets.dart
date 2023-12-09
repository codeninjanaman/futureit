import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:google_fonts/google_fonts.dart';
class orderwidgets extends StatelessWidget {
  const orderwidgets({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subtitle,
  });

  final double height;
  final double width;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: height*0.14,
      width: width*0.25,
      decoration: BoxDecoration(
        border: Border.all(
          color: Pallete.black,
          width: 0.3
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 4, // Blur radius
        offset: Offset(3, 3), // Offset in the y direction
      ),
    ],

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.03,),
          Text(title,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: Pallete.black,
          fontSize: 24
        )
      ),),
      
      Text(subtitle,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: Pallete.yellow1,
          fontSize: 10
        )
      ),),
        ],
      )
    );
  }
}
