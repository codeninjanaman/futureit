import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:google_fonts/google_fonts.dart';
class nsebse extends StatelessWidget {
  const nsebse({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: 
        Expanded(
          child: Container(
            
            // padding: EdgeInsets.all(8),
              height: size.height*0.16,
              // width: size.width*0.4,
              
              // padding: EdgeInsets.only(right: 14,left: 14,top: 7,bottom: 7),
              decoration: BoxDecoration(
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 3, // Spread radius
        blurRadius: 3, // Blur radius
        offset: Offset(0, 1), // Offset in the y direction
      ),
    ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(17)
              ),
        
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child:Image(image: AssetImage('assets/images/nse1.png'),
                    height: size.height*0.06,),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 15,left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          children: [
                            Image(image: AssetImage('assets/images/nsechart.png'),
                        height: size.height*0.02,),
                        SizedBox(width: size.width*0.03,),
                        Image(image: AssetImage('assets/images/nselogo.png'),
                        height: size.height*0.02,),
                          ],
                        ),
                        SizedBox(height: size.height*0.02,),
                        Text('NIFTY 50',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          color: Pallete.yellow1
        ),
        )
        ),
        Text('20,000.45',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          color: Pallete.black
        ),
        )
        ),
        Text('0.00(0.00%)',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          color: Colors.green
        ),
        )
        )
                        

                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 10,
                   child: Text('02/11/2023',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 7,
            // fontWeight: FontWeight.w500,
          color: Pallete.black
        ),
        )
        ),
                  )
        
                  
                ],
              ),
            
            ),
        ),
        // ),
        

        SizedBox(
          width: size.width*0.05,
        ),
        Expanded(
          child: Container(
            // padding: EdgeInsets.all(8),
              height: size.height*0.16,
              // width: size.width*0.4,
              
              // padding: EdgeInsets.only(right: 14,left: 14,top: 7,bottom: 7),
              decoration: BoxDecoration(
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 3, // Spread radius
        blurRadius: 3, // Blur radius
        offset: Offset(0, 1), // Offset in the y direction
      ),
    ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(17)
              ),
        
              child: Stack(
                children: [
                  Positioned(
                    bottom: 5,
                    right: 10,
                   child: Text('02/11/2023',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 7,
            // fontWeight: FontWeight.w500,
          color: Pallete.black
        ),
        )
        ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child:Image(image: AssetImage('assets/images/bse1.png'),
                    height: size.height*0.06,),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 15,left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          children: [
                            Image(image: AssetImage('assets/images/nsechart.png'),
                        height: size.height*0.02,),
                        SizedBox(width: size.width*0.03,),
                        Image(image: AssetImage('assets/images/bselogo.png'),
                        height: size.height*0.014,),
                          ],
                        ),
                        SizedBox(height: size.height*0.02,),
                        Text('NIFTY 50',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          color: Pallete.yellow1
        ),
        )
        ),
        Text('20,000.45',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          color: Pallete.black
        ),
        )
        ),
        Text('0.00(0.00%)',
        style: GoogleFonts.inter(
           textStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          color: Colors.green
        ),
        )
        )
                        

                      ],
                    ),
                  )
        
                  
                ],
              ),
            
            ),
        ),
      ],
    );
  }
}