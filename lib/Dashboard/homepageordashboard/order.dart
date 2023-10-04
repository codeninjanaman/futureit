import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/homepageordashboard/viewholdings.dart';

class orderwidget extends StatelessWidget {
  const orderwidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.all(20),
        // Change the color as needed
     child: Column(
       children: [
         SizedBox(height: height*0.015,),
         Container(
          padding: EdgeInsets.only(left: 20,right: 20),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
         
               Column(
                 children: [
                   Container(
                 
               height: MediaQuery.of(context).size.height*0.06,
               width: width*0.13,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  border: Border.all(
                   color: Colors.white70,
                   width: 1
                  )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text('0',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),),
                   ],
                 )
               ),
               SizedBox(height: 5,),
               Text('Pending',
               style: TextStyle(
                 color: Colors.white
               ),)
                 ],
               ),
               Column(
                 children: [
                   Container(
                 
              height: MediaQuery.of(context).size.height*0.06,
               width: width*0.13,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  border: Border.all(
                   color: Colors.white70,
                   width: 1
                  )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text('0',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),),
                   ],
                 )
               ),
               SizedBox(height: 5,),
               Text('Traded',
               style: TextStyle(
                 color: Colors.white,
                 
               ),)
                 ],
               ),
               Column(
                 children: [
                   Container(
                 
               height: MediaQuery.of(context).size.height*0.06,
               width: width*0.13,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  border: Border.all(
                   color: Colors.white70,
                   width: 1
                  )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text('0',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),),
                   ],
                 ),
               ),
               SizedBox(height: 5,),
               Text('Modified',
               style: TextStyle(
                 color: Colors.white
               ),)
                 ],
               ),
             ],
           ),
         ),

         SizedBox(height: height*0.035,),

         viewholdings(height: height, width: width),

        //  SizedBox(height: height*0.015,),
        //  Container(
        //   width: double.infinity,
        //   height: 2,
        //   color: Color(0xFF8C64FF),
        //  )

       ],
     ),
            );
  }
}

