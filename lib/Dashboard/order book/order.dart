import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/homepageordashboard/viewholdings.dart';
import 'package:futureit/Dashboard/order%20book/orderwidgets.dart';
import 'package:futureit/constants.dart';
import 'package:google_fonts/google_fonts.dart';

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

     padding: EdgeInsets.only(top: 7,right: 12,left: 12),
        // Change the color as needed
     child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
       child: Row(
        children: [
          orderwidgets(height: height, width: width, title: '0', subtitle: 'Pending'),
          // SizedBox(width: width*0.03,),
          orderwidgets(height: height, width: width, title: '0', subtitle: 'Traded'),
          // SizedBox(width: width*0.03,),
          orderwidgets(height: height, width: width, title: '₹0.00', subtitle: 'Booked P/L'),
          
          orderwidgets(height: height, width: width, title: '0', subtitle: 'Available Limit'),
          orderwidgets(height: height, width: width, title: '₹0.00', subtitle: 'Holding Value')
          
        ],
       ),
     )
            );
  }
}


