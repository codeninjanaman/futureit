import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// String uri = 'http://192.168.135.39:3000';

class Pallete{
  User? user = FirebaseAuth.instance.currentUser;


  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const color1= Color(0xFF110C2C);
  static const color2= Color(0xFFD69A38);
}