import 'package:flutter/material.dart';
import 'package:futureit/Getstarted.dart';
import 'package:futureit/onboarding/onboardingone.dart';
import 'package:futureit/onboarding/onboardingthree.dart';
import 'package:futureit/onboarding/onboardingtwo.dart';
import 'package:futureit/login/loginscreen.dart';
import 'package:futureit/signup.dart/signupscreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
import 'constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';

class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              onboardingone(),
              onboardingtwo(),
              onboardingthree()
            ],
          ),
          Positioned(
            bottom: 70,
            left: 20,
            right: 0,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                _totalPages,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: (index == _currentPage) ? 50 : 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: (index == _currentPage) ? Pallete.yellow1 : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.yellow1
              ),
              onPressed: () {
                if (_currentPage < _totalPages - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  // Navigate to Get Started page or perform any action when the last slide is reached
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedPage()));
                  Get.to(getstarted());
                }
              },
              child: Text(_currentPage < _totalPages - 1 ? 'Next' : 'Get Started',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Pallete.black1,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


