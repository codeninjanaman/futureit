import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.color1,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Pallete.color1,
        title: Text('About Us',
        style: TextStyle(
          color: Colors.white
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,
        color: Colors.white,))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Container(
              
              child: Image.asset('assets/images/aboutus1.png'),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
Text.rich(
                        TextSpan(
                          
                          children: [
                          TextSpan(text: "Finit: ",
                          style: TextStyle(
                            color: Pallete.color2,
                            fontSize: 15
                          )),
                          TextSpan(text: "Where Finance and Technology Converge",
                          style: TextStyle(color: Colors.white,
                          fontSize: 15))
                        ]
                        ),

                        textAlign: TextAlign.justify,
                      ),

                      SizedBox(height: 6,),
                      Text(
                        
                        'Welcome to Finit, where the worlds of finance and technology seamlessly unite to empower your financial journey like never before. We are your trusted partner in the world of trading, offering innovative solutions that make your financial goals achievable.\n\nAt Finit, we understand that navigating the complexities of financial markets can be a daunting task. That\'s why we\'ve created a revolutionary copytrading app that takes the guesswork out of trading. Our mission is to democratize trading by providing you with the tools and expertise needed to succeed in the ever-changing financial landscape.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13
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