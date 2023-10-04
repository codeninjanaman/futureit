import 'package:flutter/material.dart';
import 'package:futureit/onboarding/onboardingone.dart';
import 'package:futureit/onboarding/onboardingtwo.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/signup.dart/signupscreen.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
import 'constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       LiquidSwipe(
    //         pages:[
    //           onboardingone(),
    //           onboardingtwo()
    //         ] )
    //     ],
    //   ),
    // );


    return Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFD69A38),
                Color(0xFF110C2C),
              ],
            )
          ),
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged:(index){
                setState(() {
                  onLastPage= (index ==1);
                });
              } ,
              children: [
                onboardingone(),
                onboardingtwo()
              ],
            ),
            Container(
              alignment: Alignment(0, 0.54),
    
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                
                  SmoothPageIndicator(controller: _controller, count:2,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Pallete.color1,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8
                  ),
                  ),
    
                ],
              )),
            //  Container(
            //   width:size.width ,
            //   alignment: Alignment(0,0.8),
            //    child: ElevatedButton(onPressed: (){
            //     // Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
            //    }, 
            //    child: Text("SignUp/Login",
            //    style: TextStyle(
            //     fontSize: 18,
            //     color: Colors.black
            //    ),))
            //  ),
             Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment:Alignment(0,0.8),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Pallete.color1,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text("LOGIN",
                    style: TextStyle(
                      color: Colors.white
                    )))),
                  SizedBox(width: 10,),
                  Expanded(child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Pallete.color1
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => signupscreen()));
                    }, child: Text("SIGNUP",
                    style: TextStyle(
                      color: Colors.white
                    ),)))
                ],
              ),
             )
          ],
        ),
      ),
    );
  }
}