import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('About Us',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: Pallete.black,
            fontSize: 16,
          )
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,
        color: Pallete.black,))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            Container(
              padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
              child: Image.asset('assets/images/aboutus.png'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
Text.rich(
                        TextSpan(
                          
                          children: [
                          TextSpan(text: "Finit: ",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                            color: Pallete.yellow1,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          )
                          )),
                          TextSpan(text: "Where Finance and Technology Converge",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(color: Pallete.black,
                          fontSize: 15)
                          ))
                        ]
                        ),

                        textAlign: TextAlign.justify,
                      ),

                      SizedBox(height: 6,),
                      Text(
                        
                        'Welcome to Finit, where the worlds of finance and technology seamlessly unite to empower your financial journey like never before. We are your trusted partner in the world of trading, offering innovative solutions that make your financial goals achievable.\n\nAt Finit, we understand that navigating the complexities of financial markets can be a daunting task. That\'s why we\'ve created a revolutionary copytrading app that takes the guesswork out of trading. Our mission is to democratize trading by providing you with the tools and expertise needed to succeed in the ever-changing financial landscape.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 12
                        )
                        ),)
                ],
              )
            )
          ],
        )
      ),
    );
  }
}