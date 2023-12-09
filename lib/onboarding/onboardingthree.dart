import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class onboardingthree extends StatelessWidget {
  const onboardingthree({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Keep your\ninvestments safe!',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Pallete.black1,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  )
                ),),

                SizedBox(height: size.height*0.08,),

          Align(
            alignment: Alignment.center,
            child: Image(
                    width: size.width*0.77,
                    height: size.height*0.32,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/onboarding3.png'),
                  ),
          ),



        ],
      ),
    );
  }
}