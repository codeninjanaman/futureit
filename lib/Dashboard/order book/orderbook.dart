import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class orderbook extends StatefulWidget {
  const orderbook({super.key});

  @override
  State<orderbook> createState() => _orderbookState();
}

class _orderbookState extends State<orderbook> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
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
          title: Text('Order Book',
          style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                    )),
    
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios,
          color: Pallete.black,))
        ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Trading Calls",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.black,
                      fontSize: 16
                    ),
                    ),),
                  ),
                  // SizedBox(height: size.height*0.01,),

                  
                        Container(
                          height: size.height*0.05,
                          padding: EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                          width: double.infinity,
                          
                          color: Pallete.yellow1,
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Stocks',
                        style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    )),
                  
                        Text('SL',
                        style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    )),
                  
                        Text('TGT',
                        style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    )),
                  
                        Text('Time',
                        style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    ),),
                  
                        Text('Status',
                        style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    ),),

                        Text('P/L',
                        style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    ),),
                      ],
                    )
                        ),
                        SizedBox(height: size.height*0.01,),

                        Align(
                          alignment: Alignment.center,
                          child: Text('No Trading calls!',
                          style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      color: Pallete.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    )),
                        )
                      
                ],
              ),
            )
          ),
        ),
    )
    ;
  }
}

