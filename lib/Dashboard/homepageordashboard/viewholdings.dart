import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';

class viewholdings extends StatelessWidget {
  const viewholdings({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Container(
        padding: EdgeInsets.only(left: 17,right: 17),
         child: Row(
             children: [
          Expanded(
            child: Container(
              height: height*0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('₹ 0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),),
                  Text('MTM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),)
                ],
              ),
            ),
          ),
          SizedBox(
            width: width*0.05,
          ),
       
          Expanded(
            child: Container(
              
              height: height*0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('₹ 0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),),
                  Text('Booked P/L',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),)
                ],
              ),
            ),
          )
             ],
           ),
       ),
    SizedBox(height: height*0.015,),

    Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height*0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('₹ 0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),),
                  Text('Available Limit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),)
                ],
              ),
            ),
          ),
          SizedBox(
            width: width*0.05,
          ),
    
          Expanded(
            child: Container(
              height: height*0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('₹ 0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),),
                  Text('Holding Value',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    ),
     
     SizedBox(height: height*0.04,),
     Container(
          width: double.infinity,
          height: 2,
          color: Pallete.color2
         )
     ],
    );
  }
}